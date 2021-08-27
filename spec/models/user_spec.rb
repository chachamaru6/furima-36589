require 'rails_helper'

RSpec.describe User, type: :model do
  describe "ユーザー新規登録" do

    it "nicknameが空だと登録できない" do
     user = User.new(nickname: '', email: '')
    end
    it "emailが空では登録できない" do
    end
    it "passwordが空では登録できない" do
    end
    it "再passwordが空では登録できない" do
    end
    it "last_nameが空では登録できない" do
    end
    it "first_nameが空では登録できない" do
    end
    it "last_name_kanaが空では登録できない" do
    end
    it "first_name_kanaが空では登録できない" do
    end
    it "birthdayが空では登録できない" do
    end
  end


end
