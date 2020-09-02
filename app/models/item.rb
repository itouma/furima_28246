class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user, optional: true
  has_one_attached :image
  has_one :purchase

  belongs_to_active_hash :category
  belongs_to_active_hash :item_status
  belongs_to_active_hash :cost_burden
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :ship_date

  # PASSWORD_REGEX = [3-9][0-9]{2}|[1-9][0-9]{3,6}.freeze
  # 半角英数字
  with_options presence: true do
    validates :image
    validates :name, length: { maximum: 40 }
    validates :text, length: { maximum: 1000 }
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Out of setting range' }
    # 全角NG 半角数字のみ?できたか後でチェック
  end

  # 空の投稿を保存できないようにする 数字のみ
  with_options presence: { message: 'Select' } do
    validates :category, :item_status, :cost_burden, :prefecture, :ship_date
  end
  with_options numericality: { greater_than: 0, message: 'Select' } do
    validates :category_id
    validates :item_status_id
    validates :cost_burden_id
    validates :prefecture_id
    validates :ship_date_id
  end
  validates :user_id, presence: true
end
