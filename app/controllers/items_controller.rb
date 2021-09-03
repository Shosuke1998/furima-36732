class ItemsController < ApplicationController
  def index
  end

  def new
  end

  def create
    Item.create(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :content, :category_id, :condition_id, :shipping_charge_id, :region_id, :days_to_ship_id, :price, :user_id)
  end
end
