class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :admin
  has_one :doctor

  has_one_attached :avatar, service: :cloudinary

  has_many :appointments
  has_many :doctors, through: :appointments

  validates :password, length: { minimum: 6, maximum: 12}, on: :create
  validates :phone_number, presence: true, uniqueness: true

  def is_doctor?
    doctor.present?
  end

  def is_admin?
    admin.present?
  end

  def email_required?
    false
  end

  def email_changed?
    false
  end
end
