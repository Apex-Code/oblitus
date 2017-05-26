class User < ActiveRecord::Base

has_many :lists
has_many :items, through: :list_items
has_secure_password
end
