FactoryBot.define do
  factory :user do
    nickname              { 'makino' }
    email                 { Faker::Internet.free_email }
    password              { Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1) }
    password_confirmation { password }
    lastname             { '牧野' }
    firstname            { '幹弘' }
    lastname_kana        { 'マキノ' }
    firstname_kana       { 'ミキヒロ' }
    date_of_birth        { '1997-12-20' }
  end
end
