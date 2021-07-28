class Api::V1::CustomersController < ApplicationController
  def show
    customer = Customer.find(params[:id])
    render json: CustomerSerializer.new(customer)
  end

  def create
    begin
      customer = Customer.find(params[:customer_id])
      sub = Subscription.find(params[:subscription_id])
      sub.status = true
      customer.subscriptions << sub
      render json: CustomerSerializer.new(customer)
    rescue StandardError => e
      render json: {error: "id does not exist"}, status: 404
    end
  end

  def update
    customer = Customer.find(params[:id])
    sub = customer.subscriptions.find(params[:subscription_id])
    sub.status = false
    sub.save
    render json: CustomerSerializer.new(customer)
  end
end
