class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one :history
  has_one_attached :image

  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping
  belongs_to_active_hash :area
  belongs_to_active_hash :preparation

  with_options presence: true do
    validates :name
    validates :price, format: { with: /\A[0-9]+\z/, message: "Half-width number" }
    validates :description
    validates :user
  end

  with_options numericality: { other_than: 0 } do
    validates :condition_id
    validates :shipping_id
    validates :area_id
    validates :preparation_id 
    validates :category_id
  end 
  after(:build) do |item|
    item.image.attach(io: File.open('download/test_omuraice.png'), filename: 'test_omuraice.png')
  end
end






