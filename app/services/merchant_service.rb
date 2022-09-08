class MerchantService
  
  def self.all_merchants
    response = conn.get("/api/v1/merchants")
    json_response(response)
  end
  
  private
  
  def self.conn
    Faraday.new('http://localhost:3000')
  end

  def self.json_response(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end