require 'rails_helper'

RSpec.describe 'Merchant Show page', :vcr do
  let(:m) { MerchantsFacade.merchant(1)}
  let(:i) { MerchantsFacade.merchant_items(m.id).first}

  context 'merchant dashboard' do
    it 'shows a merchants name & items' do
      visit api_v1_merchant_path(m.id)

      expect(page).to have_content("#{m.name}'s Dashboard")
      expect(page).to have_content("#{m.name}'s Current Stock")

      within "#item-#{i.id}" do
        expect(page).to have_content("#{i.name}")
      end
    end
  end
end