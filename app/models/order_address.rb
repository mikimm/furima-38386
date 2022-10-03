class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_number, :region_id, :municipalities, :address, :building, :phone_number, :user_id, :item_id, :order_id,
                :token

  with_options presence: true do
    validates :post_number, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :region_id
    validates :municipalities
    validates :address
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'is invalid.' }
    validates :user_id
    validates :item_id
    validates :token
  end
  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(post_number: post_number, region_id: region_id, municipalities: municipalities, address: address,
                   building: building, phone_number: phone_number, order_id: order.id)
  end
end
