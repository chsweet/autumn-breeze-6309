require 'rails_helper'

RSpec.describe FlightLog do
  describe 'relationships' do
    it { should belong_to(:flight) }
    it { should belong_to(:passenger) }
  end
end
