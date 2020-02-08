class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @items = Item.where(seller_id: current_user.id).order('id DESC')
    
  end

end