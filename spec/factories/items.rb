FactoryBot.define do
  factory :item do
    name  { Faker::Food.sushi }
    text  { Faker::Address.full_address }
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'public/apple-touch-icon.png')) }
    price { Faker::Number.within(range: 300..9_999_999) }
    category_id do
      Faker::Number.within(range: 1..10)
    end
    item_status_id do
      Faker::Number.within(range: 1..6)
    end
    cost_burden_id do
      Faker::Number.within(range: 1..2)
    end
    prefecture_id do
      Faker::Number.within(range: 1..47)
    end
    ship_date_id do
      Faker::Number.within(range: 1..3)
    end
    association :user

    user_id { FactoryBot.create(:user).id }
  end
end
