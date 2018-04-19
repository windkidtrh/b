class PointsController < ApplicationController
    before_action :logged_in_user, only: [:show, :create, :destroy]
    before_action :real_user,      only: [:show, :create, :destroy]
    def create
        @point = Point.new(point_params)
        if  @point.save
            flash[:success] = "Point created!"
            redirect_to request.referrer
        else
            flash[:danger] = "enter data don't blank"
            # @feed_point_items = []
            redirect_to request.referrer
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
        @count = Point.where("num=?", @point.num)
        @count.each do |msg|
            if (msg.current_thinckness)/(msg.original_thinckness) > 0.8 and (msg.current_thinckness)/(msg.original_thinckness) <= 1
                @minor_point  += 1
            elsif  0.8 >= (msg.current_thinckness)/(msg.original_thinckness) and (msg.current_thinckness)/(msg.original_thinckness) > 0.5
                @medium_point += 1 
            else
                @severe_point += 1
            end
        end
        
    end

    private
        def point_params
            params.require(:point).permit(:num, :current_thinckness,
                                        :equip_id, :original_thinckness)
        end
end
