FactoryBot.define do
 factory :user do
   first_name   { Faker::Name.first_name }
   last_name    { Faker::Name.last_name }
   phone_number { Faker::PhoneNumber.phone_number }
   password     { Faker::Internet.password(min_length: 6, max_length: 12) }
 end
end
