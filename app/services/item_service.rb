class ItemService
  extend CallHelper

  def self.all_items
    response = conn.get("api/v1/items")
    json_response(response)
  end

  def self.item(id)
    response = conn.get("api/v1/items/#{id}")
    json_response(response)
  end
end