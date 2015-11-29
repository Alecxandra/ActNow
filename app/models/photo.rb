class Photo
  include Mongoid::Document
  belongs_to :post
  
  mount_uploader :url, PictureUploader
end
