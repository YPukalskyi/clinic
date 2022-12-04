FactoryBot.define do
  factory :doctor do
    association :user, factory: :user
    association :categories, factory: :category, strategy: :build
  end
end
