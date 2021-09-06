require 'rails_helper'

RSpec.describe Order, type: :model do

  before do
    @order = FactoryBot.build(:order)
  end

  describe '購入内容確認' do

    context '商品購入がうまくいく時' do
      it '全ての値が正しく入力されていれば購入できること' do
        expect(@order).to be_valid
      end
    end

    context '商品購入がうまくいかない時' do
      it 'post_numberが空だと購入できない' do
        @order.post_number = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Post number can't be blank")
      end
      it 'post_numberにハイフンがないと購入できない' do
        @order.post_number = "1234567"
        @order.valid?
        expect(@order.errors.full_messages).to include("Post number is invalid. Include hyphen(-)")
      end
      it 'prefectureが未選択だと購入できない' do
        @order.prefecture_id = 1
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture Select")
      end
      it 'cityが空だと購入できない' do
        @order.city = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end
      it 'address_numが空だと購入できない' do
        @order.address_num = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Address num can't be blank")
      end
      it 'telephoneが空だと購入できない' do
        @order.telephone = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Telephone can't be blank")
      end
      it 'telephoneが範囲外では購入できない' do
        @order.telephone = 123456789012
        @order.valid?
        expect(@order.errors.full_messages).to include("Telephone Out of setting range")
      end
      it 'telephoneが10桁未満では購入できない' do
        @order.telephone = 123456789
        @order.valid?
        expect(@order.errors.full_messages).to include("Telephone Out of setting range")
      end

    end
  end
end
