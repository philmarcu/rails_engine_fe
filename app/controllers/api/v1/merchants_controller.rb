class Api::V1::MerchantsController < ApplicationController
  def index
    @merchants = MerchantsFacade.all_merchants
  end

  def show
    id = params[:id].to_i
    @merchant = MerchantsFacade.merchant(id)
    @items = MerchantsFacade.merchant_items(id)
  end
end