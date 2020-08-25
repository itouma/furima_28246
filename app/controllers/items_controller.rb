class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index,:show]
  before_action :set_item, only: [:show]
  
  def index
    @items = Item.order("created_at DESC")
  end

  def new
    
  end

  def create
    
  end

  def edit
      
  end

  def updata
      
  end

  def show
  end

  def destroy
      
  end


  private

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
  
  def message_params
    params.require(:item).permit(:name, :price, :image).merge(user_id: current_user.id)
  end
  
  def set_item
    @item = Item.find(params[:id])
  end
end