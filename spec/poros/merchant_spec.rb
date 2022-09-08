require 'rails_helper'

RSpec.describe Merchant do
  it 'creates a new Merchant' do
    data = {
     "attributes": { "name": "Blooby Blues" }
    }

    merchant = Merchant.new(data)
    expect(merchant).to be_a Merchant
    expect(merchant.name).to eq(data[:attributes][:name])
  end
end
