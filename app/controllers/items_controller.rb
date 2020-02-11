class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :show,:update]
  
  def index
    @items = Item.order('id DESC').limit(3).where(status: "exibiting")
    @older_items = Item.order('id ASC').limit(3).where(status: "exibiting")
  end

  def new
    @item = Item.new
    4.times{ @item.images.build }

    #セレクトボックスの初期値設定
    @category_parent_array = ["---"]
    #データベースから、親カテゴリーのみ抽出し、配列化
    Category.where(ancestry: nil).each do |parent|
    @category_parent_array << parent.name
    end

  end

  # 親カテゴリーが選択された後に動くアクション
  def get_category_children
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  # 子カテゴリーが選択された後に動くアクション
  def get_category_grandchildren
    #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to root_path
  end

  def edit
    @images = @item.images
    #セレクトボックスの初期値設定
    @category_parent_array = ["---"]
    #データベースから、親カテゴリーのみ抽出し、配列化
    Category.where(ancestry: nil).each do |parent|
    @category_parent_array << parent.name
  end


  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end


  def create
    @item = Item.create(item_params)
    if @item.save!
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @user = User.where(id: @item.seller_id)
    @image_first = @item.images[0]
    @image_others = @item.images[1..3]
  end

          
private
  def item_params
    params.require(:item).permit(
      :seller_id, :category_id, :name, :description, :postage_id, :region_id, :shipping_date_id, :price, :condition_id, :status, images_attributes: [:id, :image]
    )
  end
      

  def set_item
    @item = Item.find(params[:id])
  end

end
