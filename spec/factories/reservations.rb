FactoryBot.define do
  factory :reservation do
    total { 1.5 }
    reserved_date { "2022-06-02 11:20:50" }
    city { "MyString" }
    user_id { 1 }
  end
end
