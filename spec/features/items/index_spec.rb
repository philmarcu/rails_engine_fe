require 'rails_helper'

RSpec.describe 'Items Index page', :vcr do
  let(:i1) { ItemFacade.all_items[0] }
  let(:i2) { ItemFacade.all_items[1] }

  context 'happy path' do
    it 'shows all items in d/b' do
      visit api_v1_items_path
      expect(page).to have_content("Items Index")

      within "#item-#{i1.id}" do
        expect(page).to have_content("Item Nemo Facere")
      end
      within "#item-#{i2.id}" do
        expect(page).to have_content("Item Expedita Aliquam")
      end
    end

    it 'has a link to a items show' do
      visit api_v1_items_path
      
      within "#item-#{i1.id}" do
        click_link "Item Nemo Facere"
        expect(page).to have_current_path(api_v1_item_path(i1.id))
      end
    end
  end
end