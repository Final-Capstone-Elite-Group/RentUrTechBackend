FactoryBot.define do
  factory :equipment, class: 'Equipment' do
    title { FFaker::Lorem.characters(10) }
    description { FFaker::Lorem.characters(200) }
    review { FFaker::Lorem.word }
    duration { FFaker::Random.rand(60) }
    rent_fee { FFaker::Random.rand(1000) }
    total_amount_payable { FFaker::Random.rand(1000) }
    user { association :user }
    image { Rack::Test::UploadedFile.new('spec/assets/test.png', 'image/png') }
  end
end
