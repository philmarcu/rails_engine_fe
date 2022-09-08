class MerchantService
  
  def self.all_merchants
    response = conn.get("/api/v1/merchants")
    json = JSON.parse(response.body, symbolize_names: true)
  end
  
  private
  
  def self.conn
    Faraday.new('http://localhost:3000')
  end
end