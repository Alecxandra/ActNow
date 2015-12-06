class Profile
  include Mongoid::Document
  include Mongoid::Timestamps
  belongs_to :user
  has_many :posts
  has_many :solutions
  has_many :comments
  #field :photo, type: String
  field :first_name, type: String
  field :last_name, type: String
  field :about, type: String
  field :email, type: String
  field :phone_number, type: String
  mount_uploader :photo, PictureUploader
end
