class EquipUploader < CarrierWave::Uploader::Base
    storage :file

    def store_dir
      "/media/wind/工作/work/ruby_work/design/design/inputxls/equip/#{model.id}"
    end
  
    def extension_whitelist
      %w(xls xlsx)
    end
  
    def filename
      if original_filename 
        # @name ||= Digest::MD5.hexdigest(File.dirname(current_path))
        "equips.#{file.extension}"
      end
    end
  
  end