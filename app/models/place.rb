class Place
  include Mongoid::Document
   belongs_to :post
  field :latitude, type: Float
  field :longitude, type: Float
end
