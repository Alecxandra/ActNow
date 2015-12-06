class Place
  include Mongoid::Document
  include Mongoid::Timestamps
   belongs_to :post
  field :latitude, type: Float
  field :longitude, type: Float
end
