require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'RELATIONS' do
    it { is_expected.to have_and_belong_to_many :doctors }
  end

  describe 'VALIDATION' do
    it { is_expected.to validate_uniqueness_of(:name) }
  end
end
