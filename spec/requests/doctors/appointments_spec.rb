require 'rails_helper'

RSpec.describe Doctors::AppointmentsController, type: :request do
  context 'when current_user is patient' do
    let(:user) { FactoryBot.create(:user) }

    before do
      login_as(user, scope: :user)

      FactoryBot.create(:appointment, user: user)
    end

    it '#index' do
      expect{
        get '/doctors/appointments'
      }.to raise_error(CanCan::AccessDenied)
    end

    it '#edit' do
      expect{
        get "/doctors/appointments/#{Appointment.last.id}/edit"
      }.to raise_error(CanCan::AccessDenied)
    end

    it '#update' do
      expect{
        put "/doctors/appointments/#{Appointment.last.id}",
          params: { appointment: { recommendation: 'Dead ;)' } }
      }.to raise_error(CanCan::AccessDenied)
    end
  end

  context 'when current_user is doctor' do
    let(:user) { FactoryBot.create(:doctor).user }

    before do
      login_as(user, scope: :user)
    end

    it '#index' do
      get '/doctors/appointments'

      expect(response).to render_template(:index)
    end

    it '#edit' do
      get "/doctors/appointments/#{Appointment.last.id}/edit"

      expect(response).to render_template(:edit)
    end

    it '#update' do
      put "/doctors/appointments/#{Appointment.last.id}",
        params: { appointment: { recommendation: 'Dead ;)' } }

      expect(response).to redirect_to(doctors_appointments_path)
    end
  end
end
