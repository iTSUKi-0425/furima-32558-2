require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe "商品出品機能" do

    it "商品画像がないと出品できない" do
      
    end

    it "商品名がないと出品できない" do
          @item.name = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it "商品の説明がないと出品できない" do
      @item.description = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end

    it "価格についての情報がないと登録できない" do
      @item.price = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it"販売価格は半角数字じゃないと出品できない" do
      @item.price = "９００"
      @item.valid?
      binding.pry
      expect(@item.errors.full_messages).to include("Price half-width number")
    end

    it "価格の範囲が¥300~¥9,999,999じゃないと出品できない" do
    end

    it "カテゴリーの情報がないと登録できない" do
      
    end

    it "商品の状態についての情報がないと登録できない" do
      @item.condition_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition must be other than 0")
    end

    it "配送料の負担についての状態がないと出品できない" do
      @item.shipping_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping must be other than 0")
    end

    it "発送元の地域についての情報がないと出品できない" do
      @item.area_id = 
      @item.valid?
      expect(@item.errors.full_messages).to include("Area must be other than 0")
    end

    it "発送までの日数についての情報がないと出品できない" do
      @item.preparation_id = 
      @item.valid?
      expect(@item.errors.full_messages).to include("Preparation must be other than 0")
    end
  end
end

