class Product < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :categories, join_table: :products_categories
  has_many :reviews

  validates :name, presence: true, uniqueness: { scope: :user }
  validates :price, presence: true, numericality: { greater_than: 0}
  validates :stock, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}

end
