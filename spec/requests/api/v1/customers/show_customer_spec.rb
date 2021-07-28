require 'rails_helper'

describe 'Show Customer Endpoint' do
  describe 'Happy Path' do
    before :each do
      @customer = Customer.create!(first_name: 'Harrison', last_name: 'Blake', email: 'test')
      @customer.subscriptions.create!(title: 'Summer Mellow', price: 4.99, status: true)
      @customer.subscriptions.first.teas.create!(title: 'Green Tea', description: 'Green tea is a type of tea that is made from Camellia sinensis leaves and buds that have not undergone the same withering and oxidation process used to make oolong teas and black teas.', brew_time: 10.30)
      @customer.subscriptions.first.teas.create!(title: 'Mint Tea', description: 'Mint tea is an herbal tea that is appreciated around the world for its fresh aroma and soothing taste. Mint tea benefits are widely promoted, but not all of them are supported by scientific studies. Other types of mint tea—such as Skinny Mint Tea—have become popular based, in part, on the benefits of mint tea.', brew_time: 10.30)
    end

    it "shows all customer's active and inactive subscriptions" do
      VCR.use_cassette('show_customer') do
        get "/api/v1/customers/#{@customer.id}"
      end

      expect(response).to be_success

      customer = JSON.parse(response.body, symbolize_names: true)

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
  end
end
