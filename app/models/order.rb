class Order < ApplicationRecord
  has_many :cartitems

  validates_presence_of :name, on: :purchase
  validates_presence_of :state, on: :purchase
  validates_presence_of :email,  on: :purchase
  validates_presence_of :ccnumber,  on: :purchase
  validates_presence_of :ccexpiration, on: :purchase
  validates_presence_of :cvv, on: :purchase
  validates_presence_of :address, on: :purchase
  validates_presence_of :zipcode, on: :purchase

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
