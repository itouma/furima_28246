class Purchase < ApplicationRecord
  belongs_to :item
  belongs_to :user
  validates :name, :price, presence: true, unless: :was_attached?

  validates :user_id,  presence:true,numericality: { only_integer: true }
  validates :item_id,  presence:true,numericality: { only_integer: true }

  def was_attached?
    self.image.attached?
  end
end