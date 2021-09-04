require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品できるとき' do
      it 'image,name,content,category_id,condition_id,shipping_charge_id,region_id,days_to_ship_id,priceがあれば登録できる' do
        expect(@item).to be_valid
      end
    end
    
    context '商品出品できない時' do
      it 'imageは必須' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameがなければ出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'contentがなければ出品できない' do
        @item.content = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Content can't be blank")
      end
      it 'category_idがなければ出品できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'condition_idがなければ出品できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it 'shipping_charge_idがなければ出品できない' do
        @item.shipping_charge_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charge can't be blank")
      end
      it 'region_idがなければ出品できない' do
        @item.region_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Region can't be blank")
      end
      it 'days_to_ship_idがなければ出品できない' do
        @item.days_to_ship_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Days to ship can't be blank")
      end
      it 'priceがなければ出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格は300~9999999までの範囲' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end
      it '価格は半角数値' do
        @item.price = '３３３３'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end
      
    end
  end
  
end
