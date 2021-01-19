class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one :order
  has_one :history
  has_one_attached :image

  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping
  belongs_to_active_hash :area
  belongs_to_active_hash :preparation

  with_options presence: true do
    validates :name
    validates :price, numericality: { with: /\A[0-9]+\z/, message: "Half-width number" }
    validates :price, numericality: {only_integer: true,:greater_than => 299,:less_than  =>10000000, message: "Out of setting range"}
    validates :description
    validates :user
    validates :image
  end

  with_options numericality: { other_than: 0 } do
    validates :condition_id
    validates :shipping_id
    validates :area_id
    validates :preparation_id 
    validates :category_id
  end 
end
