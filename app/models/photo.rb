class Photo
  include Mongoid::Document
  belongs_to :post
  mount_uploader :url, PictureUploader
   after_save :check_metadata
  
   def check_metadata
     logger.debug("url de la foto  #{self.url}")
      if self.url == nil
          self.destroy
      else
         if self.url.present? && self.url.metadata.present?
             exif = self.url.metadata["image_metadata"]
           Place.create(latitude:transformToDecimal(exif['GPSLatitude']), longitude:transformToDecimal(exif['GPSLongitude']), post_id: self.post.id)
             #self.post.place.create(latitude: transformToDecimal(exif['GPSLatitude']), longitude: transformToDecimal(exif['GPSLongitude']))
             logger.debug("Resultado exif #{exif}")
             logger.debug("Cositas de posicionamiento, Longitud: #{exif['GPSLongitude']}, Latitud #{exif['GPSLatitude']}")
      end
      end  
      
   end
    
   def transformToDecimal(text)
      decimal_number = 0;
      parts = text.split
      decimal_number = parts[0].to_i
      decimal_number = decimal_number + (parts[2].delete("'").to_f * 1.0/60.0)
      decimal_number = decimal_number + (parts[3].delete("\"").to_f * 1.0/3600.0)
        if parts[4] == "S" || parts[4] == "W"
          decimal_number = decimal_number * -1.0
        end
      return decimal_number
   end
  
end
