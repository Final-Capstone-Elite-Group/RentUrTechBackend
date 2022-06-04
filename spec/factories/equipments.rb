FactoryBot.define do
  factory :equipment, class: 'Equipment' do
    title { FFaker::Book.author }
    description { FFaker::Book.description }
    review { FFaker::Lorem.word }
    date_reserved { Date.today }
    duration { FFaker::Random.rand(60) }
    rent_fee { FFaker::Random.rand(1000) }
    total_amount_payable { FFaker::Random.rand(1000) }
    user { association :user }
  end
end
