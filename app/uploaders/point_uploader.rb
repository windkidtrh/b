class PointUploader < CarrierWave::Uploader::Base
    storage :file
    #model.id等于user_id,唯一的
    def store_dir
      "/media/wind/工作/work/ruby_work/design/design/inputxls/point/#{model.id}"
    end
    #文件扩展类型例如，.xls结尾的文件
    def extension_whitelist
      %w(xls xlsx)
    end
  
    def filename
      if original_filename 
        # @name ||= Digest::MD5.hexdigest(File.dirname(current_path))
        "points.#{file.extension}"
      end
    end
  
  end