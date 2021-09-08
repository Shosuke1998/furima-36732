require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
  end

  context '内容に問題ない場合' do
    it "tokenがあれば保存ができること" do
      expect(@order).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it "tokenが空では登録できないこと" do
      @order.token = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Token can't be blank")
    end
    it 'userと紐づいていないと登録できない' do 
      @order.user = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("User must exist")
    end
    it 'itemと紐づいていないと登録できない' do 
      @order.item = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Item must exist")
    end
  end
end
