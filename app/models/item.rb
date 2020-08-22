class Item < ApplicationRecord

# PASSWORD_REGEX = [3-9][0-9]{2}|[1-9][0-9]{3,6}.freeze
#半角英数字


  with_options presence: { message: "can't be blank" }do
    validates :name
    validates :text
    validates :price, length: { in: 300..9999999, message: "Out of setting range" }, numericality: { only_integer: true }
    # 全角NG 半角数字のみ?できたか後でチェック
  end

  with_options presence: { message: "Select" }do
    validates :category_id
    validates :item_status_id
    validates :cost_burden_id
    validates :shipping_place_id
    validates :ship_date_id    
  end
  validates :user_id, presence:true

end