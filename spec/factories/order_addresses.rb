FactoryBot.define do
  factory :order_address do
    post_number { '157-0076' }
    region_id { 5 }
    municipalities { '北区' }
    address { '青山1-1-1' }
    building { '牧野ビル' }
    phone_number { '09012190274' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
