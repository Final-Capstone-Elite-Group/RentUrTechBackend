require 'ffaker'

FactoryBot.define do
  factory :reservation, class: 'Reservation' do
    total { rand(1..300) }
    reserved_date { DateTime.now }
    city { FFaker::Address.city }
    user { association :user }
    equipment { association :equipment }
  end
end
