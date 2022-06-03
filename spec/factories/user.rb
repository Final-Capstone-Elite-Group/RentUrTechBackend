FactoryBot.define do
  factory :user, class: 'User' do
    name { FFaker::Name.name }
    username { FFaker::Internet.user_name }
    email { FFaker::Internet.email }
    password { FFaker::Internet.password }
    role { "user" }
  end
end
