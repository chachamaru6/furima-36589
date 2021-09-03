class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :order
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :load
  belongs_to :prefecture
  belongs_to :schedule
  


  validates :name, :explanation, :image, presence: true
  validates :category_id, :status_id, :load_id, :prefecture_id, :schedule_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :price, presence: true, numericality: { with: /\A[0-9]+\z/, message: "Half-width number" }
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: "Out of setting range" }
end