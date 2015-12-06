class Solution
  include Mongoid::Document
  include Mongoid::Timestamps
  belongs_to :post
  belongs_to :profile
  field :option, type: String
end
