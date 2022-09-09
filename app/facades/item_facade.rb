class ItemFacade
  def self.all_items
    parsed_json = ItemService.all_items
    parsed_json[:data].map do |data|
      Item.new(data)
    end
  end

  def self.item(id)
    item = ItemService.item(id)
    Item.new(item[:data])
  end
end