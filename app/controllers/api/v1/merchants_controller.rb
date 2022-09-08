class Api::V1::MerchantsController < ApplicationController
  def index
    @merchants = MerchantsFacade.all_merchants
  end
end