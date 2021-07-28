class CustomerSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :first_name, :last_name, :email

  attribute :subscriptions do |object|
    object.subscriptions.each do |sub|
    end
  end
end
