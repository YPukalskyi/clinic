require 'rails_helper'

RSpec.describe Doctor, type: :model do
  describe 'RELATIONS' do
    it { is_expected.to belong_to :user }

    it { is_expected.to have_many :appointments }
    it { is_expected.to have_many(:users).through(:appointments) }

    it { is_expected.to have_and_belong_to_many :categories }

    it { is_expected.to accept_nested_attributes_for :categories }
  end
end
