require 'rails_helper'

RSpec.describe 'Merchants Index page', :vcr do
  let(:m1) { MerchantsFacade.all_merchants[0] }
  let(:m2) { MerchantsFacade.all_merchants[1] }

  context 'happy path' do
    it 'shows all merchants in d/b' do
      visit api_v1_merchants_path

      expect(page).to have_content("Merchants Index")

      within "#merc-#{m1.id}" do
        expect(page).to have_content("Schroeder-Jerde")
      end
      within "#merc-#{m2.id}" do
        expect(page).to have_content("Klein, Rempel and Jones")
      end
    end

    it 'has a link to a merchants show' do
      visit api_v1_merchants_path
      
      within "#merc-#{m1.id}" do
        click_link "Schroeder-Jerde"
        expect(page).to have_current_path(api_v1_merchant_path(m1.id))
      end
    end
  end
end