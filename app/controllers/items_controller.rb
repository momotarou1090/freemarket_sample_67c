class ItemsController < ApplicationController
  
  def index

  end

  def new
    @item = Item.new
    10.times{ @item.images.build }
  end

  def create
    Item.create(item_params)

    # if @item.save!
    #   redirect_to root_path
    # else
    #   render :new
    # end
  end

  def show
    # @item = Item.find(params[:id])
  end

  private
  def item_params
    params.require(:item).permit(:seller_id, :categories_id, :name, :description, :postage, :region, :shipping_date, :price, :condition, :status, images_attributes: [:id, :image])
  end

end
