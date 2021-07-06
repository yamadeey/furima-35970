class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :user
  has_one_attached :image
  belongs_to_active_hash :category
  belongs_to_active_hash :description
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :delivery
  belongs_to_active_hash :status

  with_options presence: true do
    validates :title, :text, :image
  end

  with_options numericality: {oter_than: 1 } do
    validates :description, :category_id, :prefecture_id, :delivery_id, :status_id
  end
  with_options format: { with: /\A[0-9]+\z/ } do
    validates :price, numericality: {greater_than: 300, less_than: 9999999 }
  end
end
