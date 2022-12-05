require 'rails_helper'

RSpec.describe Patients::AppointmentsController, type: :request do
  context 'when current_user is patient' do
    let(:user) { FactoryBot.create(:user) }

    before do
      login_as(user, scope: :user)
    end

    xit '#index'
    xit '#new'
    xit '#edit'
    xit '#create'
    xit '#update'
  end
end
