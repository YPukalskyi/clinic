require 'rails_helper'

RSpec.describe Admin, type: :model do
  describe 'RELATIONS' do
    it { is_expected.to belong_to :user }
  end
end
