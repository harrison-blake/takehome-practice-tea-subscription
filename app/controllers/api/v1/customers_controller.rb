class Api::V1::CustomersController < ApplicationController
  def show
    customer = Customer.find(params[:id])
    render json: CustomerSerializer.new(customer)
  end

  def create
    sub = Subscription.find(params[:subscription_id])
    sub.status = true
    customer = Customer.find(params[:customer_id])
    customer.subscriptions << sub

    render json: CustomerSerializer.new(customer)
  end

  def update
    customer = Customer.find(params[:id])
    sub = customer.subscriptions.find(params[:subscription_id])
    sub.status = false
    sub.save
    render json: CustomerSerializer.new(customer)
  end
end
