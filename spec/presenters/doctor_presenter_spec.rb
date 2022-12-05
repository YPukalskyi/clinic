require 'rails_helper'

RSpec.describe DoctorPresenter, type: :presenter do
  it '#full_name' do
    doctor = Doctor.new(user: User.new(first_name: 'Chantel', last_name: 'Dubodis'))
    expect(doctor.presenter.full_name).to eq 'Chantel Dubodis'
  end
end
