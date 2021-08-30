require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

   context '新規登録できるとき' do

    it 'nickname、email、password、password_confirmation、last_name、first_name、birthdayが存在すれば登録できる' do
      expect(@user).to be_valid
    end
    it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
      @user.password = '1a1a1a'
      @user.password_confirmation = '1a1a1a'
      expect(@user).to be_valid
    end

   end


   context '新規登録できないとき' do

    it "nicknameが空だと登録できない" do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空では登録できない" do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it '重複したemailが存在する場合登録できないこと' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it "emailに@がないと登録できない" do
      @user.email = "kkkgmail.com"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
      end
    it "passwordが空では登録できない" do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "passwordが半角英数字混合でなければ登録できない" do
      @user.password = "aaaaaa"
      @user.password_confirmation = "aaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password 半角英数字混合にしてください")
      end
    it 'passwordが5文字以下であれば登録できないこと' do
      @user.password = '12345'
      @user.password_confirmation = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'passwordとpassword_confirmationが不一致では登録できないこと' do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'passwordは全角文字を含むと登録できない' do
      @user.password = 'あああああ1'
      @user.password_confirmation = 'あああああ1'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password 半角英数字混合にしてください")
    end

    it "last_nameが空だと登録できない" do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
    it "last_nameは全角（漢字・ひらがな・カタカナ）でなければ登録できない" do
      @user.last_name = "kana"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name 全角文字を使用してください")
      end
    it "first_nameが空だと登録できない" do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
      end
    it "first_nameは全角（漢字・ひらがな・カタカナ）でなければ登録できない" do
      @user.first_name = "kana"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name 全角文字を使用してください")
      end
    it "last_name_kanaが空では登録できない" do
      @user.last_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end
    it "last_name_kanaは全角（カタカナ）でなければ登録できない" do
      @user.last_name_kana = "かな"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana 全角カナを使用してください")
      end
    it "first_name_kanaが空では登録できない" do
      @user.first_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it "first_name_kanaは全角（カタカナ）でなければ登録できない" do
      @user.first_name_kana = "かな"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana 全角カナを使用してください")
      end
    it "birthdayが空では登録できない" do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end

   end

    
  end


end
