require 'rails_helper'

RSpec.describe Flight do
  describe 'relationships' do
    it { should belong_to(:airline) }
    it { should have_many(:flight_logs) }
    it { should have_many(:passengers).through(:flight_logs) }
  end
end
