class Api::V1::MerchantsController < ApplicationController
  def index
    @merchants = MerchantsFacade.all_merchants
  end

  def show
    merchants = MerchantsFacade.all_merchants
    id = params[:id].to_i
    @merchant = (merchants.select { |m| m.id == id }).first 
  end
end