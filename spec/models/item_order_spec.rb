require 'rails_helper'

describe ItemOrder, type: :model do
  before do
    @item_order = FactoryBot.build(:item_order)
    @item = FactoryBot.build(:item)
    @user = FactoryBot.build(:user)
  end

  describe '商品出品' do
    context '商品出品がうまくいくとき' do
      it '全ての項目が入力されていれば出品ができる' do
        expect(@item_order).to be_valid
      end
      it '建物名が空でも購入できる' do
        @item_order.building_name = ''
        expect(@item_order).to be_valid
      end
    end
    
    context '商品出品がうまくいかないとき' do
      it '' do
      end
      it '郵便番号が空では購入できない' do
        @item_order.postal_code = ''
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("郵便番号を入力してください")
      end
      it '郵便番号が半角ハイフンを含む形でなければ購入できない' do
        @item_order.postal_code = '1234567'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("郵便番号は不正な値です")
      end
      it '都道府県に「---」が選択されている場合は購入できない' do
        @item_order.prefecture_id = 1
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("都道府県は1以外の値にしてください")
      end
      it '市区町村が空では購入できない' do
        @item_order.city_name = ''
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("市区町村を入力してください")
      end
      it '番地が空では購入できない' do
        @item_order.block_name = ''
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("番地を入力してください")
      end
      it '電話番号が空では購入できない' do
        @item_order.phone_number = ''
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("電話番号を入力してください")
      end
      it '電話番号が9桁以下では購入できない' do
        @item_order.phone_number = '0900000000'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include()
      end
      it '電話番号が12桁以上では出品できない' do
        @item_order.phone_number = '0900000000000'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("電話番号は不正な値です")
      end
      it '電話番号に半角数字以外が含まれている場合は購入できない' do
        @item_order.phone_number = '090o000o000'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("電話番号は不正な値です")
      end
      it 'tokenが空では購入できない' do
        @item_order.token = ''
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("カード情報を入力してください")
      end
      it 'userが紐付いていなければ購入できない' do
        @item_order.user_id = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include()
      end
      it 'itemが紐付いていなければ購入できない' do
        @item_order.item_id = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include()
      end
    end
  end
end
