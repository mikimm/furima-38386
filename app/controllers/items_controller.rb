class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:edit,:update,:destroy]
  before_action :set_item, only: [:show,:edit,:update,:destroy]
  def index
    @items = Item.includes(:user).order('created_at DESC')
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

  def show
  end

  def edit
    if @item.user != current_user
      redirect_to action: :index
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render action: :edit
    end
  end

  def destroy
    if @item.user== current_user
      @item.destroy
      redirect_to  root_path
    end
  
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :explanation, :category_id, :price, :condition_id, :burden_id, :region_id,
                                 :shippment_days_id).merge(user_id: current_user.id)
  end
  def set_item
    @item = Item.find(params[:id])
  end
end
