class Cartitem < ApplicationRecord
  belongs_to :order
  belongs_to :product

  validates :quantity, presence: true,
  numericality: { only_integer: true, greater_than: 0 }
  validates :product, presence: true, uniqueness: { scope: :order }

  def update_stock
    quantity = self.quantity
    stock = self.product.stock
    self.product.stock = stock - quantity
    self.product.save
  end

  def stat(status)
    items = []
    self.each do |item|
      if item.order.state == 'status'
        items << item
      end
    end
    return items
  end

end
