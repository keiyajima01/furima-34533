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
      it 'imageが空では保存できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("画像を入力してください")
      end
      it 'nameが空だと保存できないこと' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end
      it 'textが空だと保存できないこと' do
        @item.text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("テキストを入力してください")
      end
      it 'priceが空だと保存できないこと' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("価格を入力してください")
      end
      it 'category_idが無効だと保存ができないこと' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを入力してください")
      end
      it 'item_status_idが無効だと保存ができないこと' do
        @item.item_status_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態を入力してください")
      end
      it 'shipping_area_idが無効だと保存ができないこと' do
        @item.shipping_area_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("都道府県を入力してください")
      end
      it 'shipping_cost_idが無効だと保存ができないこと' do
        @item.shipping_cost_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料を入力してください")
      end
      it 'shipping_days_id無効だと保存ができないこと' do
        @item.shipping_days_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("日数を入力してください")
      end
      it 'priceが全角数字だと保存できないこと' do
        @item.price = '２０００'
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は300〜9999999の金額を入力してください")
      end
      it 'priceが半角英数混合では登録できないこと' do
        @item.price = '111aaa'
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は300〜9999999の金額を入力してください")
      end
      it 'priceが半角英語だけでは登録できないこと' do
        @item.price = 'aaaaaa'
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は300〜9999999の金額を入力してください")
      end
      it 'priceが300円未満では保存できないこと' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は300〜9999999の金額を入力してください")
      end
      it 'priceが1,000,000円を超過すると保存できないこと' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は300〜9999999の金額を入力してください")
      end
    end
  end
end