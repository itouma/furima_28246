class ItemsTag

  include ActiveModel::Model
  attr_accessor :tagnoname, :name, :image, :text, :price, :category_id, :item_status_id, :cost_burden_id, :prefecture_id, :ship_date_id, :user_id, :item_id

  with_options presence: true do
    validates :tagnoname
    validates :image
    validates :name, length: { maximum: 40 }
    validates :text, length: { maximum: 1000 }
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Out of setting range' }
  end
  with_options presence: { message: 'Select' } do
    validates :category_id, :item_status_id, :cost_burden_id, :prefecture_id, :ship_date_id
  end
  with_options numericality: { greater_than: 0, message: 'Select' } do
    validates :category_id
    validates :item_status_id
    validates :cost_burden_id
    validates :prefecture_id
    validates :ship_date_id
  end
  validates :user_id, presence: true


  def save
    item = Item.create(name: name, image: image, text: text, price: price, category_id: category_id, item_status_id: item_status_id, cost_burden_id: cost_burden_id, prefecture_id: prefecture_id, ship_date_id: ship_date_id, user_id: user_id)
    # tag = Tag.create(tagnoname: tagnoname)
    tag = Tag.where(tagnoname: tagnoname).first_or_initialize
    tag.save

    ItemTagRelation.create(item_id: item.id, tag_id: tag.id)
  end

end