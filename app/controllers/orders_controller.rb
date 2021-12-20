class OrdersController < ApplicationController
  before_action :authenticate_user!
  

  def index
    @item = Item.find(params[:item_id])
    @order_payment = OrderPayment.new
  end

  def create
    @order_payment = OrderPayment.new(order_params)
  end

  private

  def order_params
    params.require(:order_payment).permit(:postcode, :prefecture_id, :city, :block, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end


end
