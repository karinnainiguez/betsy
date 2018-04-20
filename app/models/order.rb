class Order < ApplicationRecord
  validates :name, presence: true
  validates :state, presence: true
  validates :email, presence: true, uniqueness: true
  validates :ccnumber, presence: true, uniqueness: true
  validates :ccexpiration, presence: true
  validates :cvv, presence: true
  validates :address, presence: true
  validates :zipcode, presence: true
end
