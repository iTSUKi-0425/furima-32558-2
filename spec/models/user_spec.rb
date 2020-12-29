require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    it "nicknameが空だと登録できない" do
      
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it "emailが空では登録できない" do
      
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it"同じemailは登録できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it"emailには「@」を含める必要がある" do
      @user.email = 'sample.com'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end

    it"passwordが空では登録できない"do
      
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it"passwordが6文字以上じゃないと登録できない" do
      @user.password = "123ab"                                     
      @user.password_confirmation = "123ab"   
      @user.valid?                    
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it"英語のみでは登録できないこと" do
      @user.password = "abcabc"                                     
      @user.password_confirmation = "abcabc"   
      @user.valid?
      expect(@user.errors.full_messages).to include("Password include both letters and numbers")
    end

    it"数字のみでは登録できないこと" do
      @user.password = "123456"                                     
      @user.password_confirmation = "123456"   
      @user.valid?                      
      expect(@user.errors.full_messages).to include("Password include both letters and numbers")
    end

    it"全角では登録できないこと" do
      @user.password = "１２３ａｂｃ"                                     
      @user.password_confirmation = "１２３ａｂｃ"   
      @user.valid?                   
      expect(@user.errors.full_messages).to include("Password include both letters and numbers")
    end

    it"passwordとpassword_confirmationは値が同じでないと登録できない" do
      @user.password = "123456"
      @user.password_confirmation = "1234567"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it"last_nameが空では登録できない" do
      
      @user.last_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it"last_nameが全角（漢字・ひらがな・カタカナ）じゃないと登録できない" do
      @user.last_name = "yamada"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name Full-width characters")
    end

    it"first_nameが空では登録できない" do
      
      @user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it"first_nameが全角（漢字・ひらがな・カタカナ）じゃないと登録できない" do
      @user.first_name = "kana"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name Full-width characters")   
    end

    it"last_name_kanaが空では登録できない" do
      @user.last_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end

    it"last_name_kanaが全角（カタカナ）じゃないと登録できない" do
      @user.last_name_kana = "abc"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana Full-width katakana characters")
      
    end

    it"first_name_kanaが空では登録できない" do
      
      @user.first_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end

    it"birthdayが空では登録できない" do
      
      @user.birthday = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end






