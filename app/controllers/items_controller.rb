class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :show,:update]
  
  def index
    @items = Item.order('id DESC').limit(3).where(status: "exibiting")
    @older_items = Item.order('id ASC').limit(3).where(status: "exibiting")
  end

  def new
    @item = Item.new
    @item.images.new
    # 4.times{ @item.images.build }
    
    #セレクトボックスの初期値設定
    @category_parent_array = ["---"]
    #データベースから、親カテゴリーのみ抽出し、配列化
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
  end
  
  
  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to root_path
  end
  
  def edit
    redirect_to action: :index unless user_signed_in?

    @images = @item.images
    # 4.times{ @item.images.build }
    @parents = Category.where(ancestry:nil)
    # 登録されている商品の孫カテゴリーのレコードを取得
    @selected_grandchild_category = @item.category
    # 孫カテゴリー選択肢用の配列作成
    @category_grandchildren_array = [{id: "---", name: "---"}]
    Category.find("#{@selected_grandchild_category.id}").siblings.each do |grandchild|
      grandchildren_hash = {id: "#{grandchild.id}", name: "#{grandchild.name}"}
      @category_grandchildren_array << grandchildren_hash
     end
  
    # 選択されている子カテゴリーのレコードを取得
    @selected_child_category = @selected_grandchild_category.parent
     # 子カテゴリー選択肢用の配列作成
    @category_children_array = [{id: "---", name: "---"}]
    Category.find("#{@selected_child_category.id}").siblings.each do |child|
      children_hash = {id: "#{child.id}", name: "#{child.name}"}
      @category_children_array << children_hash
    end

    # 選択されている親カテゴリーのレコードを取得
      @selected_parent_category = @selected_child_category.parent
    # 親カテゴリー選択肢用の配列作成
    @category_parents_array = [{id: "---", name: "---"}]
      Category.find("#{@selected_parent_category.id}").siblings.each do |parent|
      parent_hash = {id: "#{parent.id}", name: "#{parent.name}"}
    @category_parents_array << parent_hash
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
  end

  def create
    @category_parent_array = ["---"]
    #データベースから、親カテゴリーのみ抽出し、配列化
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
    
    @item = Item.new(item_params)
      if @item.save
        redirect_to root_path, notice: "商品を出品しました！"
      else
        flash[:alert] = "未入力の項目があります"
        render :new
      end
  end
  
  def update
   if @item.update(item_params)
    redirect_to root_path, notice: "商品の編集が完了しました！"
   else
    redirect_to edit_item_path, alert: "未入力の項目があります"
   end
  end

  def show
    @user = User.where(id: @item.seller_id)
    @image_first = @item.images[0]
    @image_others = @item.images[1..3]
  end

  def search
    @items = Item.search(params[:keyword])
    
  end
          
private
  def item_params
    params.require(:item).permit(
      :seller_id, :category_id, :name, :description, :postage_id, :region_id, :shipping_date_id, 
      :price, :condition_id, :status, [images_attributes: [:image, :_destroy, :id]]
    )
  end
      
  def set_item
    @item = Item.find(params[:id])
  end

end
