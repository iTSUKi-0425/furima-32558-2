class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :item_params,        only: [:index, :create]
  def index
    @history = History.new   
    if current_user.id == @item.user_id || @item.order != nil
      redirect_to root_path
    end
  end

  def create
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
    params.require(:history).permit(:postal_code, :area_id, :city, :house_number, :building_name, :phone_number).merge(item_id: params[:item_id],user_id: current_user.id,token: params[:token])
    # ↑スクショ用で改行しております。
  end

  def item_params
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.price,                     # 商品の値段
      card: order_params[:token],                       # カードトークン
      currency: 'jpy'                                   # 通貨の種類（日本円）     
    )
  end


  
    
end
