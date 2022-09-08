class MerchantService
  extend CallHelper
  
  def self.all_merchants
    response = conn.get("/api/v1/merchants")
    json_response(response)
  end

  def self.merchant(id)
    response = conn.get("api/v1/merchants/#{id}")
    json_response(response)
  end
end