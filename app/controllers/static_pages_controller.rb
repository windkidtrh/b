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
    @equip_ids = Equip.all().where(device_id:  current_user.devices.ids)
    @points    = Point.all().where(equip_id:  @equip_ids.ids)
    point_xls = @points.to_xls.force_encoding("UTF-8")
    file = "#{Rails.root}/outputxls/point/#{current_user.id}points.xls"
    f = File.new( file, "w+")
    f.write(point_xls)
    f.close
    send_file file
    # redirect_back_or points_path
    # flash[:success] = "导出测点数据成功"
  end

  def for_device
    @devices = current_user.devices.all()
    device_xls = @devices.to_xls.force_encoding("UTF-8")
    file = "#{Rails.root}/outputxls/device/#{current_user.id}devices.xls"
    f = File.new( file, "w+")
    f.write(device_xls)
    f.close
    send_file file
    # redirect_back_or devices_path
    # flash[:success] = "导出装置数据成功"
  end


  def for_equip
    @equips = Equip.all().where(device_id:  current_user.devices.ids)
    equip_xls = @equips.to_xls.force_encoding("UTF-8")
    file = "#{Rails.root}/outputxls/equip/#{current_user.id}equips.xls"
    f = File.new( file, "w+")
    f.write(equip_xls)
    f.close
    send_file file
    # redirect_back_or equips_path
    # flash[:success] = "导出设备数据成功"
  end
end

