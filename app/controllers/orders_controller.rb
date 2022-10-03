class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_item_id, only: [:index, :create]
  def index
    @order_address = OrderAddress.new
    redirect_to root_path if @item.user_id == current_user.id || @item.id = @order_address
  end

  def create
    @order_address = OrderAddress.new(order_address_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_address_params
    params.require(:order_address).permit(:post_number, :region_id, :municipalities, :address, :building, :phone_number).merge(
      user_id: current_user.id, token: params[:token], item_id: @item.id
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_address_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
