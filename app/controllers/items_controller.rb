class ItemsController < ApplicationController
  
  def index

  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:seller_id, :categories_id, :name, :description, :postage, :region, :shipping_date, :price, :condition, :status,)
  end

end
