require 'rails_helper'

RSpec.describe 'MerchantService' do
  context 'happy path' do
    it 'retreives all merchants and parses response', :vcr do
      parsed_json = MerchantService.all_merchants
      merchant = parsed_json[:data][0]

      expect(parsed_json).to be_a Hash
      expect(parsed_json[:data]).to be_a Array
    end
  end
end