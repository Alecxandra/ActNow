class Solution
  include Mongoid::Document
  belongs_to :post
  belongs_to :profile
  field :option, type: String
end
