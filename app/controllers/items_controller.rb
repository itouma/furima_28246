class ItemsController < ApplicationController
  # before_action :move_to_index, except: [:index,:show]
    skip_before_action :authenticate_user!, only: [:index, :show ]
  def index
    @items = Item.all
    @purchases = Purchase.includes(:purchase)
  end

  def new
    
  end

  def create
    
  end

  def edit
      
  end

  def show
    
  end


  private

  # def move_to_index
  #   unless user_signed_in?
  #     redirect_to action: :index
  #   end
  # end
  
  def message_params
    params.require(:item).permit(:name, :price, :image).merge(user_id: current_user.id)
  end

end