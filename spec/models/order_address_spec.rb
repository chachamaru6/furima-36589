require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '購入内容確認' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
      sleep 0.1
    end

    context '商品購入がうまくいく時' do
      it '全ての値が正しく入力されていれば購入できること' do
        expect(@order_address).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @order_address.building_name = ''
        expect(@order_address).to be_valid
      end
    end

    context '商品購入がうまくいかない時' do
      it 'post_numberが空だと購入できない' do
        @order_address.post_number = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("郵便番号を入力してください")
      end
      it 'post_numberにハイフンがないと購入できない' do
        @order_address.post_number = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('郵便番号 はハイフン(-)をつけて下さい')
      end
      it 'prefectureが未選択だと購入できない' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("都道府県 を選択して下さい")
      end
      it 'cityが空だと購入できない' do
        @order_address.city = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("市区町村を入力してください", "市区町村 全角文字で記入して下さい")
      end
      it 'address_numが空だと購入できない' do
        @order_address.address_num = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("番地を入力してください")
      end
      it 'telephoneが空だと購入できない' do
        @order_address.telephone = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("電話番号を入力してください", "電話番号 を入力して下さい")
      end
      it 'telephoneが範囲外では購入できない' do
        @order_address.telephone = 123_456_789_012
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("電話番号 を入力して下さい")
      end
      it 'telephoneが10桁未満では購入できない' do
        @order_address.telephone = 123_456_789
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("電話番号 を入力して下さい")
      end
      it 'tokenが空では購入できないこと' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("トークンを入力してください")
      end
      it '電話番号に半角数字以外が含まれている場合は購入できない' do
        @order_address.telephone = '12345678a'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("電話番号 を入力して下さい")
      end
      it 'userが紐付いていなければ購入できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Userを入力してください")
      end
      it 'itemが紐付いていなければ購入できない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Itemを入力してください")
      end
    end
  end
end
