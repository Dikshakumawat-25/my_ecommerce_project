class Product < ApplicationRecord
  belongs_to :category
  belongs_to :vendor, class_name: "User"
  has_many :product_images
  has_many :order_items
  has_many :reviews
end
