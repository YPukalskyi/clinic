class Appointment < ApplicationRecord
  MAX_ACTIVE_AMOUNT = 10

  enum status: Appointments::Statuses.options_for_enum

  belongs_to :doctor
  belongs_to :user

  validates :status, inclusion: Appointments::Statuses::STATUSES
  validates :started_at, :ended_at, presence: true
  validate :active_amount_correctness, on: :create
  validate :period_correctness, on: :create

  before_validation :ensure_status

  private

  def active_amount_correctness
    return if doctor.blank?
    return if doctor.appointments.active.count < MAX_ACTIVE_AMOUNT

    errors.add(:base, "Only #{MAX_ACTIVE_AMOUNT} active appointments is allowed")
  end

  def period_correctness
    return if doctor.blank?
    return if started_at.blank? || ended_at.blank?

    started_at_overlaps = doctor.appointments.active.where(
      '? BETWEEN started_at AND ended_at', started_at
    ).present?
    ended_at_overlaps   = doctor.appointments.active.where(
      '? BETWEEN started_at AND ended_at', ended_at
    ).present?

    return if started_at_overlaps.blank? && ended_at_overlaps.blank?

    errors.add(:base, 'Doctor is busy during this period')
  end

  def ensure_status
    return if errors.present?
    return if recommendation.blank?

    self.status = Appointments::Statuses::STATUS_INACTIVE
  end
end
