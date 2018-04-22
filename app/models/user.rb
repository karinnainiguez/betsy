class User < ApplicationRecord
  has_many :products

  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  def deactivate
    user = User.find_by(name: "Previous User")
    if !user
      user = User.create!(name: "Previous User", email: "previoususer@petsy.com")
    end
    self.products.each do |p|
      p.product_status = "retired"
      p.user_id = user.id
      return false unless p.save
    end
    return true

  end
end
