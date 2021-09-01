class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :purchase
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :load
  belongs_to :prefecture
  belongs_to :schedule


  validates :name, :expalanation, :price, presence: true
  validates :category_id, :status_id, :load_id, :prefecture_id, :schedule_id, numericality: { other_than: 1 , message: "can't be blank"}


end
