class UsersController < ApplicationController
  #两个必须条件限制
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit,  :update]
  before_action :admin_user,     only: :destroy

  def new
    @user = User.new
  end

  def show 
    @user = User.find(params[:id])
    @devices = @user.devices.paginate(page: params[:page])
  end

  def index
    @users = User.paginate(page: params[:page])
  end

  def create
    @user = User.new(user_params) 
    if @user.save
      #注册后便记录了当前用户
      log_in @user
      flash[:success] = "Welcome to the Petrochemical Corrosion App!"
      redirect_to user_url(@user)

    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    begin
      if @user.update_attributes(user_update_params)
        if user_update_params['point_adrr'].nil? and user_update_params['device_adrr'].nil? and user_update_params['equip_adrr'].nil? 
          flash[:success] = "Profile updated"
          redirect_to user_url(@user)
        elsif user_update_params['device_adrr'].nil? and user_update_params['equip_adrr'].nil?
          file = "C:/Users/Administrator/Desktop/design/a/inputxls/point/#{current_user.id}/points.xls"
          if File.exists?(file)
              xlsx   = Spreadsheet.open(file)
              sheet  = xlsx.worksheet(0)  
              @equip_ids = Equip.all().where(device_id:  current_user.devices.ids)
              sheet.each do |p|
                if @equip_ids.find_by(id: p[2])
                  begin
                      Pgrade.new(point_num: p[4], equip_id: p[2]).save
                  rescue ActiveRecord::RecordNotUnique
                  end
                  Point.create(equip_id: p[2],current_thinckness: p[1],num: p[4],original_thinckness: p[5])
                end
              end
              # File.delete(file)
          end 
          flash[:success] = "导入测点数据成功"
          redirect_to points_path

        elsif user_update_params['point_adrr'].nil? and user_update_params['equip_adrr'].nil?
          file = "C:/Users/Administrator/Desktop/design/a/inputxls/device/#{current_user.id}/devices.xls"
          if File.exists?(file)
              xlsx   = Spreadsheet.open(file)
              sheet  = xlsx.worksheet(0)  
              sheet.each do |p|
                find_device = current_user.devices.find_by(user_id: p[6])
                if !find_device.nil?
                  begin
                    Device.create(user_id: p[6], num: p[4], name: p[3], introduction: p[2])
                  rescue ActiveRecord::RecordNotUnique
                  end
                end
              end
              # File.delete(file)  
          end 
          flash[:success] = "导入装置数据成功"
          redirect_to devices_path

        elsif user_update_params['device_adrr'].nil? and user_update_params['point_adrr'].nil?
          file = "C:/Users/Administrator/Desktop/design/a/inputxls/equip/#{current_user.id}/equips.xls"
          if File.exists?(file)  
              xlsx   = Spreadsheet.open(file)
              sheet  = xlsx.worksheet(0)  
              sheet.each do |p|  
                @device_ids = Device.all().where(user_id:  current_user.id)
                if @device_ids.find_by(id: p[1])
                  begin
                    Equip.create(device_id: p[1], manufacturer: p[3], material: p[4], name: p[5], num: p[6], specie: p[7], specification: p[8])
                  rescue ActiveRecord::RecordNotUnique
                  end
                end
              end
              # File.delete(file)  
          end 
          flash[:success] = "导入设备数据成功"
          redirect_to equips_path

        end
      else
        render 'edit'
      end
    rescue ActionController::ParameterMissing
      flash[:danger] = "文件不能为空"
      redirect_to request.referrer
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end
    
  private

      def user_params
        params.require(:user).permit(:name, :email, :password,
                                     :password_confirmation)
      end

      def user_update_params
        params.require(:user).permit(:name, :email, :password,
                                     :password_confirmation,:point_adrr,:device_adrr,:equip_adrr)
      end
      # 确保是正确的用户
      def correct_user
        @user = User.find(params[:id])
        # redirect_to(root_url) unless @user == current_user
        redirect_to(root_url) unless current_user?(@user)
      end

      # 确保是管理员
      def admin_user
        redirect_to(root_url) unless current_user.admin?
      end
end
