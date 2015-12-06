class Comment
  include Mongoid::Document
  include Mongoid::Timestamps
  belongs_to :post
  belongs_to :profile
  field :message, type: String
end
