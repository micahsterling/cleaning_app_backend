class Tag < ApplicationRecord
  belongs_to :user
  has_many :post_tags
end
