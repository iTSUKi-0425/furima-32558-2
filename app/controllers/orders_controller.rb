class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]

  def index
    @item = Item.find(params[:item_id])
    redirect_to root_path if  @item.order != nil
    @history = History.new   
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def create
    @item = Item.find(params[:item_id])
    @history = History.new(order_params)
    if @history.valid?
      pay_item
      @history.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def order_params
    params.require(:history).permit(:postal_code, :area_id, :city, :house_number, :building_name, :phone_number, :order_id).merge(item_id: params[:item_id],user_id: current_user.id,token: params[:token])
    # ↑スクショ用で改行しております。
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp.api_key = "sk_test_613cf3b1791fc26c3948a057"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.price,                     # 商品の値段
      card: order_params[:token],                       # カードトークン
      currency: 'jpy'                                   # 通貨の種類（日本円）     
    )
  end


  
    
end
