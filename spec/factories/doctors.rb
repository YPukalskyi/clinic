FactoryBot.define do
  factory :doctor do
    categories { [association(:category)] }

    association :user
  end
end
