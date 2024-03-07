class Post < ApplicationRecord
  has_many :post_images, dependent: :destroy
  accepts_nested_attributes_for :post_images
  belongs_to :user

end
