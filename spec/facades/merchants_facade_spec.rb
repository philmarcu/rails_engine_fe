require 'rails_helper'

RSpec.describe 'MerchantsFacade', :vcr do
  describe 'all_merchants' do
    it 'retreives all merchants from the service' do
      merchants = MerchantsFacade.all_merchants
      
      expect(merchants).to be_a Array
      expect(merchants).to be_all Merchant
    end
  end

  describe 'single merchant' do
    it 'retreives a single merchant' do
      merchant = MerchantsFacade.merchant(1)

      expect(merchant).to be_a Merchant
      expect(merchant.id).to eq(1)
    end
  end
end