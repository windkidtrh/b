class PointsController < ApplicationController
    before_action :logged_in_user, only: [:show, :create, :destroy, :index]
    before_action :real_user,      only: [:show, :create, :destroy, :index]
    def create
        @point = Point.new(point_params)
        if  @point.save
            flash[:success] = "Point created!"
            redirect_to request.referrer
        else
            flash[:danger] = "enter data don't blank"
            redirect_to request.referrer
        end
        begin
            Pgrade.new(point_num: @point.num, equip_id: @point.equip_id).save
        rescue ActiveRecord::RecordNotUnique
        end
    end

    def destroy
        @point = Point.find(params[:id])
        @point.destroy
        flash[:success] = "Point deleted"
        redirect_to request.referrer
    end

    def show 
        @minor_point  = 0
        @medium_point = 0
        @severe_point = 0
        @point = Point.find(params[:id])
        @pgrade= Pgrade.find_by(point_num: @point.num ,equip_id: @point.equip_id )
        @equip = Equip.find(@point.equip_id) 
        @count = Point.where("num=?", @point.num).where("equip_id=?",@point.equip_id )
        @count.each do |msg|
            if (msg.current_thinckness)/(msg.original_thinckness) > @pgrade.minor_point and (msg.current_thinckness)/(msg.original_thinckness) <= 1
                @minor_point  += 1
            elsif  @pgrade.minor_point >= (msg.current_thinckness)/(msg.original_thinckness) and (msg.current_thinckness)/(msg.original_thinckness) > @pgrade.severe_point
                @medium_point += 1 
            else
                @severe_point += 1
            end
        end
       
    end

    def index
        #通过下面的方式指定了显示的内容为当前用户的数据
        @severe_list = []
        @medium_list = []
        @minor_list  = []
        @equip_ids = Equip.all().where(device_id:  current_user.devices.ids)
        @points    = Point.paginate(page: params[:page]).where(equip_id:  @equip_ids.ids)
        @points.each do |msg|
            @pgrade= Pgrade.find_by(point_num: msg.num ,equip_id: msg.equip_id )
            if (msg.current_thinckness)/(msg.original_thinckness) > @pgrade.minor_point and (msg.current_thinckness)/(msg.original_thinckness) <= 1
                @minor_list << msg.id
            elsif  @pgrade.minor_point >= (msg.current_thinckness)/(msg.original_thinckness) and (msg.current_thinckness)/(msg.original_thinckness) > @pgrade.severe_point
                @medium_list << msg.id
            else
                @severe_list << msg.id
            end
        end       
    end

    private
        def point_params
            params.require(:point).permit(:num, :current_thinckness,
                                        :equip_id, :original_thinckness)
        end
end
