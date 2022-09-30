class OrdersController < ApplicationController
before_action :authenticate_user!, except: :index
    def index
      @item = Item.find(params[:item_id])
      @order_address = OrderAddress.new
    end

    def new
      @order_address = OrderAddress.new
    end

    def create

      @item = Item.find(params[:item_id])
      @order_address = OrderAddress.new(order_address_params)

      if @order_address.valid?
        @order_address.save
        redirect_to root_path
      else
        render :index
      end
    end
  private

  def order_address_params
    params.require(:order_address).permit(:post_number,:region_id,:municipalities,:address,:building,:phone_number).merge(user_id: current_user.id,item_id: @item.id)
  end


end