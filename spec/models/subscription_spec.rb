require 'rails_helper'

describe Subscription, type: :model do
  describe "Relationships" do
    it {should have_many(:teas)}
    it {should belong_to(:customer)}
  end
end
