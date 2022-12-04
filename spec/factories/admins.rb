FactoryBot.define do
  factory :admin do
    association :user, factory: :user
  end
end
