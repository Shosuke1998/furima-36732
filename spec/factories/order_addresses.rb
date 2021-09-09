FactoryBot.define do
  factory :order_address do
    token { 'tok_abcdefghijk00000000000000000' }
    postal_code { '111-1111' }
    region_id { Faker::Number.between(from: 2, to: 47) }
    city { '東京' }
    house_number { '1-34-68' }
    building_name { Faker::Lorem.sentence }
    telephone_number { '09011111111' }
  end
end
