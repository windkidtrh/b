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

  def for_point
    @points = Point.all()
    point_xls = @points.to_xls.force_encoding("UTF-8")
    f = File.new( "outputxls/points.xls", "w+")
    f.write(point_xls)
    f.close
    redirect_back_or points_path
    flash[:success] = "导出测点数据成功"
  end

  def for_device
    @devices = Device.all()
    device_xls = @devices.to_xls.force_encoding("UTF-8")
    f = File.new( "outputxls/devices.xls", "w+")
    f.write(device_xls)
    f.close
    redirect_back_or devices_path
    flash[:success] = "导出装置数据成功"
  end


  def for_equip
    @equips = Equip.all()
    equip_xls = @equips.to_xls.force_encoding("UTF-8")
    f = File.new( "outputxls/equips.xls", "w+")
    f.write(equip_xls)
    f.close
    redirect_back_or equips_path
    flash[:success] = "导出设备数据成功"
  end

end

