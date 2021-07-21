require 'rails_helper'

describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品がうまくいくとき' do
      it '全ての項目が入力されていれば出品ができる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品がうまくいかないとき' do
      it 'imageが空では登録されない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("画像を入力してください")
      end
      it 'titleが空では登録されない' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end
      it 'descriptionが空では登録されない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明を入力してください")
      end
      it 'category_idが1では登録されない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('カテゴリーは1以外の値にしてください')
      end
      it 'status_idが1では登録されない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('商品状態は1以外の値にしてください')
      end
      it 'burden_idが1では登録されない' do
        @item.burden_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('配送の負担は1以外の値にしてください')
      end
      it 'prefecture_idが1では登録されない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('都道府県は1以外の値にしてください')
      end
      it 'delivery_idが1では登録されない' do
        @item.delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('配送日数は1以外の値にしてください')
      end
      it 'priceが空では登録されない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は数値で入力してください')
      end
      it 'priceが半角数字以外では登録できない' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は数値で入力してください')
      end
      it 'priceが半角英数混合では登録できない' do
        @item.price = '1000a'
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は数値で入力してください')
      end
      it 'priceが300より少ないと登録できない' do
        @item.price = 50
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は300以上の値にしてください')
      end
      it 'priceが9999999より多いと登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は9999999以下の値にしてください')
      end
      it 'userが存在しないと登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Userを入力してください')
      end
    end
  end
end
