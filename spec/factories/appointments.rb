FactoryBot.define do
  factory :appointment do
    status { Appointments::Statuses::STATUS_ACTIVE }
    started_at { DateTime.now }
    ended_at { DateTime.now + 10.minute }

    association :user, factory: :user
    association :doctor, factory: :doctor
  end
end
