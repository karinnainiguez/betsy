class User < ApplicationRecord
  has_many :products

  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  def deactivate
    user = User.find_by(name: "Previous User")
    User.create!(name: "Previous User" unless user
    self.products.each do |p|
      p.product_status = "Retired"
      return false unless p.save
    end
    return true

  end
end
