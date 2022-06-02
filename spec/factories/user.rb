FactoryBot.define do
  factory :user, class: 'User' do
    name { FFaker::Name.first_name }
    username { FFaker::Internet.email }
    password { FFaker::Internet.password }
  end
end
