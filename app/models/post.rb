class Post < ApplicationRecord
  belongs_to :category
  has_many :post_tags
  has_many :tags, through: :post_tags
  has_many :products
  has_many :images
end



