FactoryBot.define do
  factory :equipment, class: 'Equipment' do
    title { FFaker::Lorem.word }
    description { FFaker::Lorem.word }
    review { FFaker::Lorem.word }
    date_reserved { Date.today }
    duration { FFaker::Random.rand(60) }
    rent_fee { FFaker::Random.rand(1000) }
    total_amount_payable { FFaker::Random.rand(1000) }
  end
end
