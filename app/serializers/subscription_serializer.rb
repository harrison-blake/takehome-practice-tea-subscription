class SubscriptionSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :title, :price
end
