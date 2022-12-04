FactoryBot.define do
  factory :appointment do
    status { 'active' }
    association :user, factory: :user
    association :doctor, factory: :doctor
  end
end
