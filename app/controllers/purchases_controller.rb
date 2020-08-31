class PurchasesController < ApplicationController
  
  def index
    @item = Item.find(params[:item_id])
    @purchase = PurchaseShippingAddress.new
    if @item.user.id == current_user.id
      redirect_to root_path
    end
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase = PurchaseShippingAddress.new(purchase_params)
    if @purchase.valid?
       pay_item
       @purchase.save
       redirect_to root_path
    else
        render :index
    end
  end


  private
  
  def purchase_params
    params.require(:purchase_shipping_address).permit(:postal_code, :phone_number, :city,:city_number,:prefecture_id).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end
  
  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: params[:token],
      currency:'jpy'
    )
  end
  
end