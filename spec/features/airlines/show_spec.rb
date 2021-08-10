require 'rails_helper'

RSpec.describe 'airline show page'do
  before :each do
    @airline_1 = Airline.create!(name: 'Southwest Airlines')

    @flight_1 = @airline_1.flights.create!(number: '6837', date: '08/15/2021', departure_city: 'Denver, CO', arrival_city: 'Anchorage, AK')
    @flight_2 = @airline_1.flights.create!(number: '745', date: '10/22/2021', departure_city: 'Denver, CO', arrival_city: 'Atlanta, GA')
    @flight_3 = @airline_1.flights.create!(number: '6837', date: '08/25/2021', departure_city: 'Anchorage, AK', arrival_city: 'Denver, CO')

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

    visit airline_path(@airline_1)
  end

  it 'displays unique list of all adult passengers on airline flights' do
    expect(page).to have_content(@passenger_1.name)
    expect(page).to have_content(@passenger_2.name)
    expect(page).to_not have_content(@passenger_3.name)
    expect(page).to have_content(@passenger_4.name)
  end

  it 'displays passengers in order from most flight to least' do
    expect(@passenger_1.name).to_not appear_before(@passenger_4.name)
    expect(@passenger_2.name).to appear_before(@passenger_1.name)
    expect(@passenger_4.name).to appear_before(@passenger_2.name)
  end
end
