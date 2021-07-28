class Api::V1::SubscriptionsController < ApplicationController
  def create
    sub = Subscription.find(params[:subscription_id])
    sub.status = true
    customer = Customer.find(params[:customer_id])
    customer.subscriptions << sub

    render json: SubscriptionSerializer.new(sub)
  end
end
