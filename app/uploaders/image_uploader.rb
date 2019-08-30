class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  
  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
  
  process convert:  'jpg'
  process resize_to_limit: [700,700]

  def extension_white_list 
    %W(jpg jpeg png)
  end

end
