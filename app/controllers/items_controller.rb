class ItemsController < ApplicationController
    skip_before_action :authenticate_user!, only: [:index, :show ]
  def index
    @items = Item.all
    @purchases = Purchase.includes(:purchase)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
    else
      render :new
    end
  end

  def edit
      
  end

  def show
    
  end


  private

  def item_params
    params.require(:item).permit(:name, :text, :price,  :category_id, :item_status_id, :cost_burden_id, :prefecture_id, :ship_date_id, :user_id)
  end
  
  def message_params
    params.require(:item).permit(:name, :price, :image).merge(user_id: current_user.id)
  end

end