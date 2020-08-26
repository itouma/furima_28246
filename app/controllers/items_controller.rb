class ItemsController < ApplicationController
    skip_before_action :authenticate_user!, only: [:index, :show ]
    before_action :set_item, only: [:show]

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
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
      
  end

  def show
    
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to root_path
  end


  private

  def item_params
    params.require(:item).permit(:name, :text, :price,  :category_id, :item_status_id, :cost_burden_id, :prefecture_id, :ship_date_id, :image).merge(user_id: current_user.id)
  end
  
  def set_item
    @item = Item.find(params[:id])
  end

end