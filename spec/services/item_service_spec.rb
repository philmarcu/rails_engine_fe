require 'rails_helper'

RSpec.describe 'ItemService', :vcr do
  let(:parsed_json) { ItemService.all_items }
  let(:parsed) { ItemService.item(179)}
  let(:items) { parsed_json[:data] }

  it 'retreives all items and parses response' do
    expect(parsed_json).to be_a Hash
    expect(items).to be_a Array

    items.each do |i|
      name = i[:attributes][:name]
      desc = i[:attributes][:description]
      price = i[:attributes][:unit_price]

      expect(i).to be_a Hash
      expect(i).to have_key(:id)
      expect(i).to have_key(:attributes)
      expect(name).to be_a String
      expect(desc).to be_a String
      expect(price).to be_a Float
    end
  end

  it 'retreives a single item' do
    item = parsed[:data][:attributes]
    name = item[:name]
    desc = item[:description]
    price = item[:unit_price]

    expect(parsed.size).to eq(1)
    expect(parsed[:data]).to be_a Hash
    expect(name).to be_a String
    expect(desc).to be_a String
    expect(price).to be_a Float
  end
 end