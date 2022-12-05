require 'rails_helper'

RSpec.describe AppointmentPresenter, type: :presenter do
  describe '#status' do
    it 'is active' do
      appointment = Appointment.new(status: Appointments::Statuses::STATUS_ACTIVE)
      expect(appointment.presenter.status).to eq 'Active'
    end

    it 'is inactive' do
      appointment = Appointment.new(status: Appointments::Statuses::STATUS_INACTIVE)
      expect(appointment.presenter.status).to eq 'Inactive'
    end
  end

  it '#period' do
    appointment = Appointment.new(started_at: DateTime.now, ended_at: DateTime.now + 1.hour)
    expect(appointment.presenter.period).to eq "#{appointment.started_at.strftime("%Y.%m.%d %H:%M")} - #{appointment.ended_at.strftime("%Y.%m.%d %H:%M")}"
  end
end
