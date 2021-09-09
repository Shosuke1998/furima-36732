require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id:user.id, item_id:item.id)
    sleep 0.1
  end

  context '内容に問題ない場合' do
    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@order_address).to be_valid
    end
    it 'building_nameが空でも保存できる' do
      @order_address.building_name = ''
      expect(@order_address).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it "tokenが空では登録できないこと" do
      @order_address.token = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Token can't be blank")
    end
    it '郵便番号は空では保存できない' do
      @order_address.postal_code = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
    end
    it '郵便番号はハイフンなしでは保存できない' do
      @order_address.postal_code = '1234567'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end
    it '都道府県が空では保存できない' do
      @order_address.region_id = 1
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Region can't be blank")
    end
    it '市町村名が空だと保存できない' do
      @order_address.city = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("City can't be blank")
    end
    it '番地が空だと保存できない' do
      @order_address.house_number = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("House number can't be blank")
    end
    it '電話番号が必須であること' do
      @order_address.telephone_number = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Telephone number can't be blank")
    end
    it '電話番号は、10桁以上11桁以内の半角数値のみ保存可能なこと' do
      @order_address.telephone_number = '090-1234-5678'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Telephone number is invalid")
    end
    it 'userと紐づいていないと保存できない' do
      @order_address.user_id = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("User can't be blank")
    end
    it 'itemと紐づいていないと保存できない' do
      @order_address.item_id = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Item can't be blank")
    end
  end



end
