require 'rails_helper'

RSpec.describe UserPresenter, type: :presenter do
  it '#full_name' do
    user = User.new(first_name: 'Chantel', last_name: 'Dubodis')
    expect(user.presenter.full_name).to eq 'Chantel Dubodis'
  end
end
