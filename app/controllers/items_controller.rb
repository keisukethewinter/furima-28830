class ItemsController < ApplicationController
  before_action :move_to_index, only: [:new]

  def index
  end
  
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to action: :index
    else
      render action: :new
    end
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  private
  def item_params
    params.require(:item).permit(:image,:name,:description,:price,:category_id,:condition_id,:delivery_fee_id,:seller_prefecture_id,:shipment_day_id).merge(user_id: current_user.id)
  end
end
