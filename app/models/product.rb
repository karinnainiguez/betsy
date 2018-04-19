class Product < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :categories, join_table: :products_categories
  has_many :reviews
end
