class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to items_path
    else
      render action: :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :explanation, :category_id, :price, :condition_id, :burden_id, :region_id,
                                 :shippment_days_id).merge(user_id: current_user.id)
  end
end
