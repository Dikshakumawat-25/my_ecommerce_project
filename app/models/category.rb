class Category < ApplicationRecord
    has_many :products
    belongs_to :parent_category, class_name: "Category", optional: true
end
