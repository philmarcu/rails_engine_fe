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
end