class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :region_id, :city, :house_number, :building_name, :telephone_number, :user_id, :item_id, :order_id, :token
  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :house_number
    validates :telephone_number
    validates :user_id
    validates :item_id
    # validates :order_id
  end
  validates :region_id, numericality: {other_than: 0, message: "can't be blank"}
  
  def save
    # binding.pry
    @order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, region_id: region_id, city: city, house_number: house_number, building_name: building_name, telephone_number: telephone_number, order_id: @order.id)
  end
end