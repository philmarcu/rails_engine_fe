class Api::V1::ItemsController < ApplicationController
  def index
    @items = ItemFacade.all_items
  end

  def show
    id = params[:id].to_i
    @item = ItemFacade.item(id)
  end
end