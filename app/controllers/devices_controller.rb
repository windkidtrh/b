class DevicesController < ApplicationController
    before_action :logged_in_user, only: [:edit, :update, :index, :show, :create, :destroy]
    before_action :correct_user,   only: [:destroy, :edit, :update]

    def create
        @device = current_user.devices.build(device_params)
        if @device.save
            flash[:success] = "Device created!"
            redirect_to root_url
        else
            @feed_items = []
            render 'static_pages/home'
        end
    end

    def edit
        @device = Device.find(params[:id])
    end

    def update
        @device = Device.find(params[:id])
        if @device.update_attributes(device_params)
          flash[:success] = "Device updated"
          redirect_to device_url(@device)
        else
          render 'edit'
        end
    end

    def show 
        @device = Device.find(params[:id])
    end
    
    def destroy
        @device.destroy
        flash[:success] = "Device deleted"
        redirect_to request.referrer || root_url
    end

    def index
        @devices = current_user.devices.paginate(page: params[:page])
    end

    private
        def device_params
            params.require(:device).permit(:name,:introduction)
        end

        def correct_user
            @device = current_user.devices.find_by(id: params[:id])
            redirect_to root_url if @device.nil?
        end

end
