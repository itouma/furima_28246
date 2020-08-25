class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image
  has_one :purchase
  
  belongs_to_active_hash :category
  belongs_to_active_hash :item_status
  belongs_to_active_hash :cost_burden
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :ship_date

  # PASSWORD_REGEX = [3-9][0-9]{2}|[1-9][0-9]{3,6}.freeze
  #半角英数字
  with_options presence: { message: "can't be blank" }do
  validates :name, length: { maximum: 40 }
  validates :text, length: { maximum: 1000 }
  validates :price, length: { in: 300..9999999, message: "Out of setting range" }, numericality: { only_integer: true }
  # 全角NG 半角数字のみ?できたか後でチェック
end

  #空の投稿を保存できないようにする
  with_options presence: { message: "Select" }do
    validates :category, :item_status, :cost_burden, :prefecture, :ship_date
  end
  with_options numericality: { other_than: 0 } do
    validates :category_id
    validates :item_status_id
    validates :cost_burden_id
    validates :prefecture_id
    validates :ship_date_id    
  end
  validates :user_id, presence:true

end