require 'rails_helper'

RSpec.describe Patients::DoctorsController, type: :request do
  context 'when current_user is patient' do
    let(:user) { FactoryBot.create(:user) }

    before do
      login_as(user, scope: :user)
    end

    xit '#index'
  end
end
