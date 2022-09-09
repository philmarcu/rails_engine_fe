require 'rails_helper'

RSpec.describe 'ItemFacade', :vcr do
  describe 'all_items' do
    it 'retreives all item from the service' do
      item = ItemFacade.all_items
      
      expect(item).to be_a Array
      expect(item).to be_all Item
    end
  end

  describe 'single item' do
    it 'retreives a single item items' do
      item = ItemFacade.item(179)

      expect(item).to be_a Item
      expect(item.name).to be_a String
      expect(item.description).to be_a String
      expect(item.unit_price).to be_a Float
    end
  end
end