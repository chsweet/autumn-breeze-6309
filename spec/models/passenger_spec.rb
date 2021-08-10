require 'rails_helper'

RSpec.describe Passenger do
  describe 'relationships' do
    it { should have_many(:flight_logs) }
    it { should have_many(:flights).through(:flight_logs) }
  end
end
