module PointsHelper
    # def for_point
    #     point_xls = @points.to_xls.force_encoding("UTF-8")
    #     f = File.new( "points.xls", "w+")
    #     f.write(point_xls)
    #     f.close
    # end
    # <%= link_to "导出测点数据" , for_point_path %>
    # <button onclick="<% for_point %>" , class="btn-data">导出测点信息</button>
#     <script>
# function getSelectFile(){
# var fileName = document.getElementById("fileSelect").value;
# alert(fileName);
# }
# </script>
# <input id="fileSelect" type="file" />
# <input value="Get File" type="button" onclick="getSelectFile();" />

# require 'importex'  
# class Product < Importex::Base  
#   column "current_thinckness",:required => true  
#   column "equip_id", :type => Integer  
#   column "num", :type => Integer 
#   column "original_thinckness", :required => true
#   Product.import("points.xls")
#   Prodece = Product.all
#   Prodece.each do |p|
#     Point.create(equip_id: p["equip_id"],current_thinckness: p["current_thinckness"],num: p["num"],original_thinckness: p["original_thinckness"])
#   end
# end  

# file = "#{Rails.root}/tmp/preferred_offers.xlsx"

# file = "#{Rails.root}/tmp/points.xlsx"
# if File.exists?(file)    
#   xlsx   = Spreadsheet.open(file)
#   sheet  = xlsx.worksheet(0)  
#   sheet.each do |p|  
#     Point.create(equip_id: p[2],current_thinckness: p[1],num: p[4],original_thinckness: p[5])
#   end  
# end   
end
