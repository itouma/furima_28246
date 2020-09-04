class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user, optional: true
  has_one_attached :image
  has_one :purchase
  has_many :item_tag_relations
  has_many :tags, through: :item_tag_relations
  
  belongs_to_active_hash :category
  belongs_to_active_hash :item_status
  belongs_to_active_hash :cost_burden
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :ship_date

  
end
