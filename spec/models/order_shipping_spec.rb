require 'rails_helper'

RSpec.describe OrderShipping, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_shipping = FactoryBot.build(:order_shipping, user_id: user.id, item_id: item.id)
    sleep 0.1
  end

  describe '発送先情報の保存' do
    context '発送先情報の保存ができる場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_shipping).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @order_shipping.building_name = ''
        expect(@order_shipping).to be_valid
      end
      it 'phone_numberが11桁以内の数値だと保存できる' do
        @order_shipping.phone_number = '0901234567'
        expect(@order_shipping).to be_valid
      end
    end
    context '発送先情報の保存ができない場合' do
      it 'user_idがからだと保存できない' do
        @order_shipping.user_id = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Userを入力してください")
      end
      it 'item_idがからだと保存できない' do
        @order_shipping.item_id = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Itemを入力してください")
      end
      it 'postal_codeが空だと保存できないこと' do
        @order_shipping.postal_code = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("郵便番号を入力してください")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_shipping.postal_code = '1234567'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("郵便番号 -（ハイフン）を含め入力してください")
      end
      it 'shipping_area_idを選択していないと保存できないこと' do
        @order_shipping.shipping_area_id = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("都道府県を入力してください")
      end
      it 'shipping_area_idが０以外でないと登録できないこと' do
        @order_shipping.shipping_area_id = 0
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("都道府県を入力してください")
      end
      it 'municipalityが空だと保存ができない' do
        @order_shipping.municipality = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("市区町村を入力してください")
      end
      it 'addressが空だと保存ができない' do
        @order_shipping.address = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("番地を入力してください")
      end
      it 'phone_numberが空だと保存できない' do
        @order_shipping.phone_number = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("電話番号を入力してください")
      end
      it 'phone_numberが12桁以上だと保存できない' do
        @order_shipping.phone_number = '123456789012'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("電話番号半角数字(ハイフンなし）を入力してください")
      end
      it 'phone_numberが全角では保存できない' do
        @order_shipping.phone_number = '１１１１'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("電話番号半角数字(ハイフンなし）を入力してください")
      end
      it 'tokenが空だと登録できない' do
        @order_shipping.token = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("クレジットカード情報を入力してください")
      end
    end
  end
end