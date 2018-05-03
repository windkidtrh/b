module PointsHelper
    def for_point
        point_xls = @points.to_xls.force_encoding("UTF-8")
        f = File.new( "points.xls", "w+")
        f.write(point_xls)
        f.close
    end
end
