require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    describe '商品出品機能' do
      context '商品出品がうまくいくとき' do
        it 'name、image、explanation、category_id、status_id、load_id、prefecture_id、schedule_id、priceが存在すれば出品できる' do
          expect(@item).to be_valid
        end
      end

      context '商品出品がうまくいかないとき' do
        it 'nameが空だと出品できない' do
          @item.name = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("商品名を入力してください")
        end
        it 'imageが空だと出品できない' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("画像を入力してください")
        end
        it 'explanationが空だと出品できない' do
          @item.explanation = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("説明文を入力してください")
        end
        it 'categoryが未選択だと出品できない' do
          @item.category_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("分類 を選択してください")
        end
        it 'statusが未選択だと出品できない' do
          @item.status_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("状態 を選択してください")
        end
        it 'loadが未選択だと出品できない' do
          @item.load_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("配送料 を選択してください")
        end
        it 'scheduleが未選択だと出品できない' do
          @item.schedule_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("発送日にち を選択してください")
        end
        it 'prefectureが未選択だと出品できない' do
          @item.prefecture_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("都道府県 を選択してください")
        end
        it 'priceが空だと出品できない' do
          @item.price = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("値段を入力してください")
        end
        it 'priceが全角数値だと出品できない' do
          @item.price = '２０００'
          @item.valid?
          expect(@item.errors.full_messages).to include('値段 は半角数字を使用してください')
        end
        it 'priceが設定範囲外だと出品できない' do
          @item.price = 100_000_000
          @item.valid?
          expect(@item.errors.full_messages).to include('値段 は範囲内でお願いします')
        end
        it 'priceは英字では出品できない' do
          @item.price = 'aaa'
          @item.valid?
          expect(@item.errors.full_messages).to include('値段 は半角数字を使用してください')
        end
        it 'priceは英数字混合では出品できない' do
          @item.price = '111aaa'
          @item.valid?
          expect(@item.errors.full_messages).to include('値段 は半角数字を使用してください')
        end
        it 'priceは300未満では出品できない' do
          @item.price = 200
          @item.valid?
          expect(@item.errors.full_messages).to include('値段 は範囲内でお願いします')
        end

        it 'userの情報がなければ出品できない' do
          @item.user = nil
          @item.valid?
          expect(@item.errors.full_messages).to include('Userを入力してください')
        end
      end
    end
  end
end
