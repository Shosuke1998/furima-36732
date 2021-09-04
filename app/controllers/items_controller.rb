class ItemsController < ApplicationController
  def index
    @item = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :content, :category_id, :condition_id, :shipping_charge_id, :region_id, :days_to_ship_id,
                                 :price, :image).merge(user_id: current_user.id)
  end
end
