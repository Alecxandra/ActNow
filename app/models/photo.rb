class Photo
  include Mongoid::Document
  belongs_to :post
  #field :url, type: String
  field :description, type: String
  mount_uploader :url, PictureUploader
end
