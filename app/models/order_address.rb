class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_number, :prefecture_id, :city, :address_num, :building_name, :telephone, :item_id, :user_id, :token

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :token

    validates :post_number, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: ' はハイフン(-)をつけて下さい' }
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: ' 全角文字で記入して下さい' }
    validates :address_num
    validates :telephone, format: { with: /\A[0-9]{11}\z/, message: ' を入力して下さい' }
  end

  validates :prefecture_id, numericality: { other_than: 1, message: " を選択して下さい" }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(post_number: post_number, prefecture_id: prefecture_id, city: city, address_num: address_num,
                   building_name: building_name, telephone: telephone, order_id: order.id)
  end
end
