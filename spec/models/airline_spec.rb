require 'rails_helper'

RSpec.describe Airline do
  describe 'relationships' do
    it { should have_many(:flights) }
  end

  before :each do
    @airline_1 = Airline.create!(name: 'Southwest Airlines')

    @flight_1 = @airline_1.flights.create!(number: '6837', date: '08/15/2021', departure_city: 'Denver, CO', arrival_city: 'Anchorage, AK')
    @flight_2 = @airline_1.flights.create!(number: '745', date: '10/22/2021', departure_city: 'Denver, CO', arrival_city: 'Atlanta, GA')
    @flight_3 = @airline_1.flights.create!(number: '6837', date: '08/25/2021', departure_city: 'Anchorage, AK', arrival_city: 'Denver, CO')
    @flight_4 = @airline_1.flights.create!(number: '827', date: '08/25/2021', departure_city: 'Atlanta, GA', arrival_city: 'Denver, CO')

    @passenger_1 = Passenger.create!(name: 'Nicki', age: 33)
    @passenger_2 = Passenger.create!(name: 'Chris', age: 38)
    @passenger_3 = Passenger.create!(name: 'Marc', age: 17)
    @passenger_4 = Passenger.create!(name: 'Ashley', age: 18)

    FlightLog.create!(flight: @flight_1, passenger: @passenger_1)
    FlightLog.create!(flight: @flight_1, passenger: @passenger_2)
    FlightLog.create!(flight: @flight_1, passenger: @passenger_4)
    FlightLog.create!(flight: @flight_2, passenger: @passenger_3)
    FlightLog.create!(flight: @flight_2, passenger: @passenger_4)
    FlightLog.create!(flight: @flight_2, passenger: @passenger_2)
    FlightLog.create!(flight: @flight_3, passenger: @passenger_1)
    FlightLog.create!(flight: @flight_3, passenger: @passenger_2)
    FlightLog.create!(flight: @flight_3, passenger: @passenger_4)
    FlightLog.create!(flight: @flight_4, passenger: @passenger_4)
  end

  describe 'instance methods' do
    describe '#adult_passengers_order_flights' do
      it 'returns unique list of adult passengers ordered by flight count' do
        actual = @airline_1.adult_passengers_order_flights.map do |passenger|
          passenger.passenger_name
        end

        expect(actual).to eq([@passenger_4.name, @passenger_2.name, @passenger_1.name])
        expect(actual).to_not include(@passenger_3.name)
      end
    end
  end
end
