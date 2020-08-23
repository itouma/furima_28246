FactoryBot.define do
  factory :user do
    nickname  {Faker::Name.name}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 7)}
    password_confirmation {password}
    
    birthday  {Faker::Date.birthday(min_age: 5, max_age: 110)}
    first_name {"あア亜"}
    family_name  {"いイ伊"}
    # first_name_kana  {"アアア"}
    first_name_kana   {"アアア"}
    family_name_kana  {"イイイ"} 
    
  end
end

# Faker::Number.number(digits: 10)
# { .}
# with_options presence: { message: "can't be blank" } do
#   validates :nickname, length: { maximum: 6 }
#   validates :
#   with_options format: {with:HIRAGANA_KATAKANA_REGEX, message: "Full-width characters" } do
#     validates :
#     validates :
#   end
#   with_options format: {with:KATAKANA_REGEX, message:"Full-width katakana characters" } do
#     validates :
#     validates :
#   end
# end
# validates :password,format:{with:PASSWORD_REGEX, message: "Include both letters and numbers"  }
# # length: {minimum: 6, message:"6文字以上入力してください"}
# # validates :email, uniqueness: {message: 'そのメールアドレスは登録済みです'}
#   # emailの初期validatesでpresence:trueとuniqueness: true と@を含む必要があることが設定されてある
#   # passwordもpresence:trueと6文字以上であることが初期validatesに設定済みである
