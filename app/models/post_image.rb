class PostImage < ApplicationRecord
  belongs_to :post
  has_one_attached :image
end
