class Appointment < ApplicationRecord
  enum status: Appointments::Statuses.options_for_enum

  belongs_to :doctor
  belongs_to :user

  validates :status, inclusion: Appointments::Statuses::STATUSES
end
