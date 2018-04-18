class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @device     = current_user.devices.build
      @equip      = @device.equips.build
      @feed_items = current_user.feed.paginate(page: params[:page])
      @feed_equip_items = @device.feed_equip.paginate(page: params[:page])
    end
  end

  def help
  end

  def about
  end

  def contact
  end
end
