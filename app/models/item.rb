class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image
  belongs_to_active_hash :category
  belongs_to_active_hash :burden
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :delivery
  belongs_to_active_hash :status

  with_options presence: true do
    validates :title, :description, :image
  end

  with_options numericality: {other_than: 1 } do
    validates :burden_id, :category_id, :prefecture_id, :delivery_id, :status_id
  end

  with_options format: { with: /\A[0-9]+\z/ } do
    validates :price, numericality: {greater_than: 300, less_than: 9999999 }
  end
end
