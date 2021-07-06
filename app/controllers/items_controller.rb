class ItemsController < ApplicationController
  def index
  end

  def item_params
    params.require(:item).permit(:name, :image, :description, :status_id, :category_id, :price, :prefecture_id, :delivery_id, :burden_id,).merge(user_id: current_user.id)
  end
end
