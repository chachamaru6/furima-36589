require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品がうまくいくとき' do
      it "name、image、explanation、category、status、load、prefecture、schedule、priceが存在すれば出品できる" do
        expect(@item).to be_valid
      end
    
    context '商品出品がうまくいかないとき' do
      it "nameが空だと出品できない" do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "imageが空だと出品できない" do
        @item.image = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "explanationが空だと出品できない" do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it "categoryが未選択だと出品できない" do
        @item.category = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "statusが未選択だと出品できない" do
        @item.status = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it "loadが未選択だと出品できない" do
        @item.load = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Load can't be blank")
      end
      it "dateが未選択だと出品できない" do
        @item.date = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Date can't be blank")
      end
      it "prefectureが未選択だと出品できない" do
        @item.prefecture = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "priceが空だと出品できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "priceは半角数値でなければ出品できない" do
        @item.price = "２０００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Half-width number.")
      end
      it 'priceが設定範囲以外だと出品できない' do
        @item.price = 100000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end


    end
    　　


end
