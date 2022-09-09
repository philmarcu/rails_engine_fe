require 'rails_helper'


RSpec.describe 'Item Show page', :vcr do
  let(:i) { ItemFacade.item(179)}

  context 'Item dashboard' do
    it 'shows a Items name & items' do
      visit api_v1_item_path(i.id)

      expect(page).to have_content("#{i.name}'s Dashboard")
      expect(page).to have_content("#{i.description}")
      expect(page).to have_content("#{i.unit_price}")
    end
  end
end