class PostImage < ApplicationRecord
  belongs_to :post
  has_one_attached :image

  validates :text, presence: true
  validates :image, presence: true

end
