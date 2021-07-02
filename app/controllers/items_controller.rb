class ItemsController < ApplicationController
  
  def index
  end

  def destroy
        if user_signed_in? && current_user.id == @item.user_id
      @item.destroy
      redirect_to root_path
    end
  end
end
