require 'rails_helper'

describe 'Subscribe Customer Endpoint' do
  describe 'Happy Path' do
    before :each do
      @customer = Customer.create!(first_name: 'Harrison', last_name: 'Blake', email: 'test')
      @test_sub = Subscription.create!(title: 'Summer Mellow', price: 4.99, status: false)
      @test_sub.teas.create!(title: 'Green Tea', description: 'Green tea is a type of tea that is made from Camellia sinensis leaves and buds that have not undergone the same withering and oxidation process used to make oolong teas and black teas.', brew_time: 10.30)
      @test_sub.teas.create!(title: 'Mint Tea', description: 'Mint tea is an herbal tea that is appreciated around the world for its fresh aroma and soothing taste. Mint tea benefits are widely promoted, but not all of them are supported by scientific studies. Other types of mint tea—such as Skinny Mint Tea—have become popular based, in part, on the benefits of mint tea.', brew_time: 10.30)
    end

    it "subscribes a customer to a tea subscription" do
      params = {
                customer_id: @customer.id,
                subscription_id: @test_sub.id
               }

      headers = {"CONTENT_TYPE" => "application/json"}

      VCR.use_cassette('subscribe_customer') do
        post '/api/v1/customers', headers: headers, params: params.to_json
      end

      customer = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_success
      expect(customer[:data][:attributes]).to have_key(:first_name)
      expect(customer[:data][:attributes]).to have_key(:last_name)
      expect(customer[:data][:attributes]).to have_key(:email)
      expect(customer[:data][:attributes]).to have_key(:subscriptions)
      expect(customer[:data][:attributes][:subscriptions][0]).to have_key(:title)
      expect(customer[:data][:attributes][:subscriptions][0]).to have_key(:price)
      expect(customer[:data][:attributes][:subscriptions][0]).to have_key(:status)
      expect(customer[:data][:attributes][:first_name]).to be_a(String)
      expect(customer[:data][:attributes][:last_name]).to be_a(String)
      expect(customer[:data][:attributes][:email]).to be_a(String)
      expect(customer[:data][:attributes][:subscriptions]).to be_an(Array)
      expect(customer[:data][:attributes][:subscriptions][0][:title]).to eq('Summer Mellow')
      expect(customer[:data][:attributes][:subscriptions][0][:price]).to eq(4.99)
      expect(customer[:data][:attributes][:subscriptions][0][:status]).to eq("true")
    end

    it "returns an error message if the subscription id does not exist" do
      params = {
                customer_id: @customer.id,
                subscription_id: 1
               }

      headers = {"CONTENT_TYPE" => "application/json"}

      VCR.use_cassette('subscribe_customer') do
        post '/api/v1/customers', headers: headers, params: params.to_json
      end

      error = JSON.parse(response.body, symbolize_names: true)

      expect(error).to have_key(:error)
      expect(error[:error]).to eq("id does not exist")
    end
  end
end
