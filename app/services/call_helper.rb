module CallHelper
  def conn
    Faraday.new('http://localhost:3000')
  end

  def json_response(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end