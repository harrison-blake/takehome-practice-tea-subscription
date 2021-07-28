class SubscriptionSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :title, :price, :status

  has_many :teas
end
