FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 7) }
    password_confirmation { password }

    birthday { Faker::Date.birthday(min_age: 5, max_age: 110) }
    first_name { 'あア亜' }
    family_name { 'いイ伊' }
    # first_name_kana  {"アアア"}
    first_name_kana   { 'アアア' }
    family_name_kana  { 'イイイ' }
  end
end
