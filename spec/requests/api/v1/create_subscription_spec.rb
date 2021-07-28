require 'rails_helper'

describe 'Create Subscription Endpoint' do
  describe 'Happy Path' do
    before :each do
      Customer.create(first_name: 'Harrison', last_name: 'Blake', email: 'test')
      test_sub = Subscription.create!(title: 'Summer Mellow', price: 4.99)
      test_sub.teas.create(title: 'Green Tea', description: 'Green tea is a type of tea that is made from Camellia sinensis leaves and buds that have not undergone the same withering and oxidation process used to make oolong teas and black teas.', brew_time: 10.30)
      test_sub.teas.create(title: 'Mint Tea', description: 'Mint tea is an herbal tea that is appreciated around the world for its fresh aroma and soothing taste. Mint tea benefits are widely promoted, but not all of them are supported by scientific studies. Other types of mint tea—such as Skinny Mint Tea—have become popular based, in part, on the benefits of mint tea.', brew_time: 10.30)
    end

    it "subscribes a customer to a tea subscription" do
      params = {
                user_id: 3,
                subscription_id: 2
               }

      headers = {"CONTENT_TYPE" => "application/json"}

      VCR.use_cassette('add_users_roomie_requests') do
        post '/api/v1/subscriptions', headers: headers, params: params.to_json
      end

      expect(response).to be_success

      expect(user[:data][:attributes]).to have_key(:title)
      expect(user[:data][:attributes]).to have_key(:price)
      expect(user[:data][:attributes][:title]).to be_a(String)
      expect(user[:data][:attributes][:price]).to be_a(Float)
    end
  end
end
