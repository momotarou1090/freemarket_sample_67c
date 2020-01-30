class ItemsController < ApplicationController
  
  def index

  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
    binding.pry
  end

  private
  def item_params
    params.require(:item).permit(:id, :image)
  end

end
