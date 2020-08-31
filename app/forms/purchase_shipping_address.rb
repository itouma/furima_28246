class PurchaseShippingAddress

  include ActiveModel::Model
  attr_accessor :postal_code, :phone_number, :city,:city_number,:prefecture_id, :user_id, :item_id,:building_name,:token

  with_options presence: true do
    validates :token
    validates :postal_code,format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :phone_number,format: 
    {with: /\A[0-9]{,11}\z/, message: "is invalid. Include hyphen(-)"}, length: { maximum: 11}
    validates :city
    validates :city_number
    validates :user_id,numericality: { only_integer: true }
    validates :item_id,numericality: { only_integer: true }
  end
  with_options presence: { message: "Select" } do
  validates :prefecture_id,numericality: { greater_than: 0 ,message: "Select"}
   end
   
  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)

    ShippingAddress.create(postal_code: postal_code, phone_number: phone_number, city: city, city_number: city_number, prefecture_id: prefecture_id, building_name: building_name, purchase_id: purchase.id)
  end
end