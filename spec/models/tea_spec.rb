require 'rails_helper'

describe Tea, type: :model do
  describe "Relationships" do
    it {should belong_to(:subscription)}
  end
end
