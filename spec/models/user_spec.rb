require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'RELATIONS' do
    it { is_expected.to have_one :admin }
    it { is_expected.to have_one :doctor }

    it { is_expected.to have_one_attached :avatar }

    it { is_expected.to have_many :appointments }
    it { is_expected.to have_many(:doctors).through(:appointments) }
  end

  describe 'VALIDATION' do
    it { is_expected.to validate_uniqueness_of(:phone_number).case_insensitive }
    it { is_expected.to validate_presence_of(:phone_number) }

    it { is_expected.to validate_length_of(:password).is_at_least(6).is_at_most(12).on(:create) }
  end

  describe 'INSTANCE METHODS' do
    it '#admin?' do
      admin = FactoryBot.create(:admin)
      expect(admin.user.admin?).to eq true
    end

    it '#doctor?' do
      doctor = FactoryBot.create(:doctor)
      expect(doctor.user.doctor?).to eq true
    end

    it '#email_required?' do
      user = User.new
      expect(user.email_required?).to eq false
    end

    it '#email_changed?' do
      user = User.new
      expect(user.email_changed?).to eq false
    end
  end
end
