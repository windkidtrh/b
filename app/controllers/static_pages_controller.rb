class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @device     = current_user.devices.build
      @feed_items = current_user.feed.paginate(page: params[:page])

      @equip      = @device.equips.build
      @feed_equip_items = @device.feed_equip.paginate(page: params[:page])
      
      @point      = @equip.points.build
      @feed_point_items = @equip.feed_point.paginate(page: params[:page])
    end
  end

  def help
  end

  def about
  end

  def contact
  end
end
