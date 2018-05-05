class DeviceUploader < CarrierWave::Uploader::Base
    storage :file

    def store_dir
      "/media/wind/工作/work/ruby_work/design/design/inputxls/device/#{model.id}"
    end
  
    def extension_whitelist
      %w(xls xlsx)
    end
  
    def filename
      if original_filename 
        # @name ||= Digest::MD5.hexdigest(File.dirname(current_path))
        "devices.#{file.extension}"
      end
    end
  
  end