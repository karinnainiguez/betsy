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
    self.cartitems.each do |item|
      item.update_stock
    end
  end

end
