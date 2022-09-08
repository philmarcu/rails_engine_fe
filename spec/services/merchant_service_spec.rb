require 'rails_helper'

RSpec.describe 'MerchantService', :vcr do
  context 'happy path' do
    let(:parsed_json) { MerchantService.all_merchants }
    let(:merchants) { parsed_json[:data] }

    it 'retreives all merchants and parses response' do
      expect(parsed_json).to be_a Hash
      expect(merchants).to be_a Array
      expect(merchants.size).to eq(100)
      binding.pry
      
      merchants.each do |m|
        expect(m).to be_a Hash
        expect(m).to have_key(:id)
        expect(m).to have_key(:attributes)

        expect(m[:id]).to be_a(String)
        expect(m[:type]).to be_a(String)
        expect(m[:type]).to eq("merchant")

        name = m[:attributes][:name]
        expect(name).to be_a(String)
      end
    end

    it 'retreives a single merchant' do
      parsed = MerchantService.merchant(1)
      name = parsed[:data][:attributes][:name]

      expect(parsed.size).to eq(1)
      expect(parsed[:data]).to be_a Hash
      expect(name).to be_a String
    end
  end
end