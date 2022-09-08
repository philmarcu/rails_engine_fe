require 'rails_helper'

RSpec.describe 'ItemService', :vcr do
  context 'happy path' do
    let(:merchant) { MerchantsFacade.all_merchants.first}
    let(:parsed_json) { ItemService.merchant_items }
    
    it 'retreives a specific merchants items' do
      expect(parsed_json).to be_a Hash
    end
  end
end