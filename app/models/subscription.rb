class Subscription < ApplicationRecord
  has_many :teas
  belongs_to :customer
end
