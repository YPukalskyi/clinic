require 'rails_helper'

RSpec.describe Appointment, type: :model do
  describe 'RELATIONS' do
    it { is_expected.to belong_to :doctor }
    it { is_expected.to belong_to :user }
  end

  describe 'VALIDATION' do
    it { is_expected.to allow_value(*Appointments::Statuses::STATUSES).for(:status) }
    it { is_expected.to validate_presence_of(:started_at) }
    it { is_expected.to validate_presence_of(:ended_at) }

    describe '#active_amount_correctness' do
      let(:doctor) { FactoryBot.create(:doctor) }

      before do
        10.times do |index|
          FactoryBot.create(
            :appointment,
            started_at: DateTime.now + index.next.day,
            ended_at: DateTime.now + index.next.day + 1.hour,
            doctor: doctor
          )
        end
      end

      it 'validates amount' do
        appointment = FactoryBot.build(:appointment, doctor: doctor)
        appointment.validate
        expect(appointment.errors[:base]).to include 'Only 10 active appointments is allowed'
      end
    end

    xit '#period_corectnes'

    xit '#ensure_status'
  end
end
