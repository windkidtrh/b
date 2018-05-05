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

# xlsx       = Roo::Spreadsheet.open(file, extension: :xlsx)  

# file = "#{Rails.root}/tmp/points.xlsx"
# if File.exists?(file)    
#   xlsx   = Spreadsheet.open(file)
#   sheet  = xlsx.worksheet(0)  
#   sheet.each do |p|  
#     Point.create(equip_id: p[2],current_thinckness: p[1],num: p[4],original_thinckness: p[5])
#   end  
# end   



# class ImageUploader < CarrierWave::Uploader::Base

#     # Include RMagick or MiniMagick support:
#     # include CarrierWave::RMagick
#     # include CarrierWave::MiniMagick
  
#     # Choose what kind of storage to use for this uploader:
#     storage :file
#     # storage :fog
  
#     # Override the directory where uploaded files will be stored.
#     # This is a sensible default for uploaders that are meant to be mounted:
#     def store_dir
#       "/media/wind/工作/work/ruby_work/design/design/inputxls/#{model.id}"
#     end
  
#     # Provide a default URL as a default if there hasn't been a file uploaded:
#     # def default_url
#     #   # For Rails 3.1+ asset pipeline compatibility:
#     #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
#     #
#     #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
#     # end
  
#     # Process files as they are uploaded:
#     # process scale: [200, 300]
#     #
#     # def scale(width, height)
#     #   # do something
#     # end
  
#     # Create different versions of your uploaded files:
#     # version :thumb do
#     #   process resize_to_fit: [50, 50]
#     # end
  
#     # Add a white list of extensions which are allowed to be uploaded.
#     # For images you might use something like this:
#     def extension_whitelist
#       %w(jpg jpeg gif png xls)
#     end
  
#     # Override the filename of the uploaded files:
#     # Avoid using model.id or version_name here, see uploader/store.rb for details.
#     def filename
#       if original_filename 
#         @name ||= Digest::MD5.hexdigest(File.dirname(current_path))
#         "#{@name}.#{file.extension}"
#       end
#     end
  
#   end
end
