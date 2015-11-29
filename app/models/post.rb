class Post
  include Mongoid::Document
  include Mongoid::Timestamps
  has_many :comments
  has_many :solutions
  has_many :photos
  belongs_to :profile
  has_and_belongs_to_many :tags
  field :title, type: String
  field :description, type: String
  field :place, type: String
  field :importance, type: String
  field :state, type: String
  field :counter, type: Integer
  accepts_nested_attributes_for :photos
end
