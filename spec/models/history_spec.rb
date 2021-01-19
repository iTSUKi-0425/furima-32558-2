require 'rails_helper'

RSpec.describe History, type: :model do
    before do
      @user = FactoryBot.build(:user)  
      @item = FactoryBot.build(:item,user_id: @user)
      @history = FactoryBot.build(:history, item_id:@item, user_id: @user)

    end
  describe "商品購入機能" do
    #正常系
    context '商品購入ができるとき' do

      it "全ての情報が正しく入力されている場合購入できる。" do
        expect(@history).to be_valid
      end

      it "建物番号が空の場合でも購入できる " do
        @history.building_name = ""
        expect(@history).to be_valid
      end
    end

      #異常系
    context '商品購入ができないとき' do

      it "郵便番号がないと購入することができない" do
        @history.postal_code = ""
        @history.valid? 
        expect(@history.errors.full_messages).to include("Postal code can't be blank")
      end

      it "郵便番号はハイフンがないと購入することができない" do
        @history.postal_code = "1234567"
        @history.valid? 
        expect(@history.errors.full_messages).to include("Postal code Input correctly")
      end

      it "都道府県がないと購入することができない" do 
        @history.area_id = 0
        @history.valid? 
        expect(@history.errors.full_messages).to include("Area Select")
      end

      it "市区町村の記載ないと購入することができない" do
        @history.city = ""
        @history.valid? 
        expect(@history.errors.full_messages).to include("City can't be blank")
      end

      it "番地の記載がないと購入することができない" do
        @history.house_number = ""
        @history.valid? 
        expect(@history.errors.full_messages).to include("House number can't be blank")
      end

      it "電話番号がないと購入することができない" do
        @history.phone_number = ""
        @history.valid? 
        expect(@history.errors.full_messages).to include("Phone number can't be blank")
      end

      it "電話番号はハイフンがあると購入することができない" do
        @history.phone_number = "090-1234-5678"
        @history.valid? 
        expect(@history.errors.full_messages).to include("Phone number Input only number")
      end

      it "電話番号は12桁以上あると購入することができない" do
        @history.phone_number = "090123456789"
        @history.valid? 
        expect(@history.errors.full_messages).to include("Phone number Input only number")
      end

      it "tokenが空では登録できないこと" do
        @history.token = nil
        @history.valid?
        expect(@history.errors.full_messages).to include("Token can't be blank")
      end

      it "ユーザーidが空の場合は購入できない" do
        @history.user_id = nil
        @history.valid?
        expect(@history.errors.full_messages).to include("User can't be blank")
      end

      it "アイテムidが空の場合は購入できない" do
        @history.item_id = nil
        @history.valid?
        expect(@history.errors.full_messages).to include("Item can't be blank")
      end
    end
  end  
end
