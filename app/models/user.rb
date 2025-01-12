class User < ApplicationRecord
    has_secure_password

    has_many :addresses
    has_many :orders
    has_many :cart_items
    has_many :reviews
    has_many :wishlists
end
