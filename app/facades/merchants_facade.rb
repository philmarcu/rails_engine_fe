class MerchantsFacade
  def self.all_merchants
    parsed_json = MerchantService.all_merchants

    parsed_json[:data].map do |data|
      Merchant.new(data)
    end
  end

  def self.merchant(id)
    Merchant.new(MerchantService.merchant(id)[:data])
  end

  def self.merchant_items(id)
    parsed_json = MerchantService.merchant_items(id)

    parsed_json[:data].map do |data|
      Item.new(data)
    end
  end
end