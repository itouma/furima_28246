class ShippingAddress < ApplicationRecord
  belongs_to :purchase  

  # belongs_to_active_hash :prefecture
  with_options presence: true do
    validates :postal_code,format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :phone_number,format: 
    {with: /\A[0-9]{,11}\z/, message: "is invalid. Include hyphen(-)"}, length: { maximum: 11}
    validates :city
    validates :city_number
  end
  with_options presence: { message: "Select" }do
  validates :prefecture_id,numericality: { greater_than: 0 ,message: "Select"}
  end
end