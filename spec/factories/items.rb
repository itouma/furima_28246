FactoryBot.define do
  factory :item do
    name  {Faker::Food.sushi}
    text  {Faker::Address.full_address}
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'public/apple-touch-icon.png')) }
    price       {Faker::Number.within(range: 300..9999999) }
    category_id   {Faker::Number.within(range: 1..10) 
    }
    item_status_id {Faker::Number.within(range: 1..6) 
    }
    cost_burden_id {Faker::Number.within(range: 1..2) 
    }
    prefecture_id {Faker::Number.within(range: 1..47) 
    }
    ship_date_id {Faker::Number.within(range: 1..3) 
    }
    association :user

    user_id {FactoryBot.create(:user).id}
  end
end
