class EquipUploader < CarrierWave::Uploader::Base
    storage :file

    def store_dir
      "C:/Users/Administrator/Desktop/design/a/inputxls/equip/#{model.id}"
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