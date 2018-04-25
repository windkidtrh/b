class EquipsController < ApplicationController
    before_action :logged_in_user, only: [:edit, :update, :show, :create, :destroy, :index]
    before_action :real_user,      only: [:edit, :update, :show, :create, :destroy, :index]
    def create
        begin
            @equip = Equip.new(equip_params)
            @equip.save
            flash[:success] = "Equip created!"
            redirect_to request.referrer
        rescue ActiveRecord::RecordNotUnique 
            flash[:danger] = "Equip has been exist!"
            # @feed_equip_items = []
            redirect_to request.referrer
        end
    end

    def show 
        @equip = Equip.find(params[:id]) 
        @points = @equip.points.paginate(page: params[:page])    
        if logged_in?
            @point =  @equip.points.build
            @feed_point_items = @equip.feed_point.paginate(page: params[:page])
        end
    end

    def edit
        @equip = Equip.find(params[:id])
    end

    def update
        @equip = Equip.find(params[:id])
        if @equip.update_attributes(equip_edit_params)
          flash[:success] = "Equip updated"
          redirect_to equip_url(@equip)
        else
          render 'edit'
        end
    end

    def destroy
        @equip = Equip.find(params[:id])
        @equip.destroy
        flash[:success] = "Equip deleted"
        redirect_to request.referrer

    end

    def index
        @equips = Equip.paginate(page: params[:page]).where(device_id:  current_user.devices.ids)
    end

    private
        def equip_params
            params.require(:equip).permit(:specie, :name, :num, :device_id, :manufacturer,
                                          :material, :specification)
        end

        def equip_edit_params
            params.require(:equip).permit(:specie, :name, :num, :manufacturer,
                                          :material, :specification)
        end

end
