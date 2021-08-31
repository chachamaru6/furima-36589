class Itemdatum < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre

  validates :name, :expalanation, :category, :status, :load, :prefecture, :date, :price, presence: true
  validates :genre_id, numericality: { other_than: 1 , message: "can't be blank"}

end
