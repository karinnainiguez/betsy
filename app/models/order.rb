class Order < ApplicationRecord
  has_many :cartitems

  # validates :name, presence: true
  # validates :state, presence: true
  # validates :email, presence: true, uniqueness: true
  # validates :ccnumber, presence: true, uniqueness: true
  # validates :ccexpiration, presence: true
  # validates :cvv, presence: true
  # validates :address, presence: true
  # validates :zipcode, presence: true

  def complete_checkout
    self.state = "paid"
    self.save
    self.cartitems.each do |item|
      item.update_stock
    end
  end

  def self.filter_by(user_id)
    items = []
    self.all.each do |order|
      order.cartitems.each do |item|
        if item.product.user.id == user_id
          items << item
        end
      end
    end
    return items
  end

end
