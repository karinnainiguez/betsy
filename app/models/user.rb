class User < ApplicationRecord
  has_many :products
  has_many :reviews, through: :products

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

  def average_rating
    reviews = self.reviews

    return 0 if reviews.count == 0

    total = reviews.map do |rating|
      rating.rating
    end.sum.to_f

    return total / reviews.count

  end
end
