class SubscriptionSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :title, :price, :status

  attribute :teas do |object|
    object.teas.each do |tea|
    end
  end
end
