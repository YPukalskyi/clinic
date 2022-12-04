require 'cloudinary'

Cloudinary.config_from_url("cloudinary://725639435655153:S0iMbsamaY8tPFKFIrxJrldUSGw@dmavrfbs8")
Cloudinary.config do |config|
  config.secure = true
end
