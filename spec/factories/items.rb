FactoryBot.define do
  factory :item do
    category_id         { 3 }
    condition_id        { 3 }
    burden_id           { 2 }
    region_id           { 3 }
    shippment_days_id { 4 }
    name                { '感謝' }
    explanation         { '感謝' }
    price               { 12345 }
    association :user 
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
