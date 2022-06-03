require 'ffaker'

FactoryBot.define do
  factory :reservation do
    total { rand(1..300) }
    reserved_date { DateTime.now }
    city { FFaker::Address.city }
    user { nil }
  end
end
