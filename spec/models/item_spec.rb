require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '新規出品ができる場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@item).to be_valid
      end
    end
    

    context '出品できない場合' do
      it 'nameが空だと保存できないこと' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'textが空だと保存できないこと' do
        @item.text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      it 'priceが空だと保存できないこと' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが全角数字だと保存できないこと' do
        @item.price = '１１１１'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end
      it 'priceが300円未満では保存できないこと' do
        @item.price = '111'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end
      it 'priceが1,000,000円を超過すると保存できないこと' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end
    end
  end
end