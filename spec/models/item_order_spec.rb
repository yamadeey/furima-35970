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
    end
    context '商品出品がうまくいかないとき' do
      it '' do
        
      end
    end
  end
end

