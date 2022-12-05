FactoryBot.define do
 factory :user do
   first_name   { Faker::Name.first_name }
   last_name    { Faker::Name.last_name }
   phone_number { Faker::PhoneNumber.phone_number }
   password     { 123456 }
 end
end
