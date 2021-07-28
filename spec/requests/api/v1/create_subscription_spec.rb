require 'rails_helper'

describe 'Create Subscription Endpoint' do
  describe 'Happy Path' do
    before :each do
      @customer = Customer.create(first_name: 'Harrison', last_name: 'Blake', email: 'test')
      @test_sub = Subscription.create!(title: 'Summer Mellow', price: 4.99, status: false)
      @test_sub.teas.create(title: 'Green Tea', description: 'Green tea is a type of tea that is made from Camellia sinensis leaves and buds that have not undergone the same withering and oxidation process used to make oolong teas and black teas.', brew_time: 10.30)
      @test_sub.teas.create(title: 'Mint Tea', description: 'Mint tea is an herbal tea that is appreciated around the world for its fresh aroma and soothing taste. Mint tea benefits are widely promoted, but not all of them are supported by scientific studies. Other types of mint tea—such as Skinny Mint Tea—have become popular based, in part, on the benefits of mint tea.', brew_time: 10.30)
    end

    it "subscribes a customer to a tea subscription" do
      params = {
                customer_id: @customer.id,
                subscription_id: @test_sub.id
               }

      headers = {"CONTENT_TYPE" => "application/json"}

      VCR.use_cassette('add_users_roomie_requests') do
        post '/api/v1/subscriptions', headers: headers, params: params.to_json
      end

      customer = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_success

      expect(customer[:data][:attributes]).to have_key(:title)
      expect(customer[:data][:attributes]).to have_key(:price)
      expect(customer[:data][:attributes]).to have_key(:status)
      expect(customer[:data][:attributes]).to have_key(:teas)
      expect(customer[:data][:attributes][:title]).to be_a(String)
      expect(customer[:data][:attributes][:price]).to be_a(Float)
    end
  end
end
