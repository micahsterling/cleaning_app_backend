class PostTag < ApplicationRecord
  belongs_to :tag
  has_many :products
end

