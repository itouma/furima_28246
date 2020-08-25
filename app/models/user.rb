class User < ApplicationRecord
  has_many :items
  has_many :purchases
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,:recoverable,:rememberable, :validatable
  # emailの初期validatesでpresence:trueとuniqueness: true と@を含む必要があることが設定されてある
  # passwordもpresence:trueと6文字以上であることが初期validatesに設定済みである

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  #半角英数字
  HIRAGANA_KATAKANA_REGEX = /\A(?:\p{Hiragana}|[ァ-ヶー－]|[ー－]|[一-龠々]|[０-９ａ-ｚＡ-Ｚ])+\z/.freeze
  #全角文字のみ
  KATAKANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze
  #全角カタカナのみ
  with_options presence: { message: "can't be blank" } do
    validates :nickname
    validates :birthday  
    with_options format: {with:HIRAGANA_KATAKANA_REGEX, message: "Full-width characters" } do
      validates :first_name
      validates :family_name
    end
    with_options format: {with:KATAKANA_REGEX, message:"Full-width katakana characters" } do
      validates :first_name_kana
      validates :family_name_kana
    end
  end
  validates :password,format:{with:PASSWORD_REGEX, message: "Include both letters and numbers"  }
  
end