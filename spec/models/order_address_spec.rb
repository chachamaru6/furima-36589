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
        expect(@order_address.errors.full_messages).to include("Post number can't be blank")
      end
      it 'post_numberにハイフンがないと購入できない' do
        @order_address.post_number = "1234567"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post number is invalid. Include hyphen(-)")
      end
      it 'prefectureが未選択だと購入できない' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと購入できない' do
        @order_address.city = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it 'address_numが空だと購入できない' do
        @order_address.address_num = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address num can't be blank")
      end
      it 'telephoneが空だと購入できない' do
        @order_address.telephone = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephone can't be blank")
      end
      it 'telephoneが範囲外では購入できない' do
        @order_address.telephone = 123456789012
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephone is invalid.")
      end
      it 'telephoneが10桁未満では購入できない' do
        @order_address.telephone = 123456789
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephone is invalid.")
      end
      it "tokenが空では購入できないこと" do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it "電話番号に半角数字以外が含まれている場合は購入できない" do
        @order_address.telephone = "12345678a"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephone is invalid.")
    end
      it "userが紐付いていなければ購入できない" do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it "itemが紐付いていなければ購入できない" do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
    end


  end
end
