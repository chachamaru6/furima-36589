class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_number, :prefecture_id, :city, :address_num, :building_name, :telephone, :item_id, :user_id


  with_options presence: true do
    validates :post_number, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
    validates :address_num
    validates :phone, format: {with: /\A\d{10}\z|\A\d{11}\z/ , message: "is invalid."}
  end

  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    address = Address.create(post_number: post_number,  prefecture_id: prefecture_id, city: city, address_num: address_num, building_name: building_name, phone: phone, order_id: order.id)
  end

end