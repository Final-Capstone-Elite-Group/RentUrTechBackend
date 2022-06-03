FactoryBot.define do
  factory :equipment_reservation do
    reservation { association :reservation }
    equipment { association :equipment }
  end
end
