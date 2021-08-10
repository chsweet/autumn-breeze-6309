require 'rails_helper'

RSpec.describe 'flights index page'do
  before :each do
    @airline_1 = Airline.create!(name: 'Southwest Airlines')
    @airline_2 = Airline.create!(name: 'United Airlines')

    @flight_1 = @airline_1.flights.create!(number: '6837', date: '08/15/2021', departure_city: 'Denver, CO', arrival_city: 'Anchorage, AK')
    @flight_2 = @airline_1.flights.create!(number: '745', date: '10/22/2021', departure_city: 'Denver, CO', arrival_city: 'Atlanta, GA')
    @flight_3 = @airline_1.flights.create!(number: '6837', date: '08/25/2021', departure_city: 'Anchorage, AK', arrival_city: 'Denver, CO')
    @flight_4 = @airline_2.flights.create!(number: '983', date: '11/13/2021', departure_city: 'Denver, CO', arrival_city: 'Rapid City, SD')
    @flight_5 = @airline_2.flights.create!(number: '983', date: '11/23/2021', departure_city: 'Rapid City, SD', arrival_city: 'Denver, CO')

    @passenger_1 = Passenger.create!(name: 'Nicki', age: 33)
    @passenger_2 = Passenger.create!(name: 'Chris', age: 38)
    @passenger_3 = Passenger.create!(name: 'Marc', age: 17)
    @passenger_4 = Passenger.create!(name: 'Ashley', age: 18)
    @passenger_5 = Passenger.create!(name: 'Kristin', age: 34)
    @passenger_6 = Passenger.create!(name: 'Kelly', age: 37)

    FlightLog.create!(flight: @flight_1, passenger: @passenger_1)
    FlightLog.create!(flight: @flight_1, passenger: @passenger_2)
    FlightLog.create!(flight: @flight_2, passenger: @passenger_3)
    FlightLog.create!(flight: @flight_2, passenger: @passenger_4)
    FlightLog.create!(flight: @flight_3, passenger: @passenger_1)
    FlightLog.create!(flight: @flight_3, passenger: @passenger_2)
    FlightLog.create!(flight: @flight_4, passenger: @passenger_4)
    FlightLog.create!(flight: @flight_4, passenger: @passenger_5)
    FlightLog.create!(flight: @flight_5, passenger: @passenger_4)
    FlightLog.create!(flight: @flight_5, passenger: @passenger_5)

    visit flights_path
  end

  it 'displays a list of all flight numbers and flights airline' do
    within("#flight-#{@flight_1.id}") do
      expect(page).to have_content(@flight_1.number)
      expect(page).to have_content(@airline_1.name)
    end

    within("#flight-#{@flight_3.id}") do
      expect(page).to have_content(@flight_3.number)
      expect(page).to have_content(@airline_1.name)
    end

    within("#flight-#{@flight_4.id}") do
      expect(page).to have_content(@flight_4.number)
      expect(page).to have_content(@airline_2.name)
    end
  end

  it 'displays all passenger for each flight' do
    within("#flight-#{@flight_1.id}") do
      within("#passenger-#{@passenger_1.id}") do
        expect(page).to have_content(@passenger_1.name)
      end
      expect(page).to_not have_content(@passenger_3.name)
    end

    within("#flight-#{@flight_2.id}") do
      within("#passenger-#{@passenger_3.id}") do
        expect(page).to have_content(@passenger_3.name)
      end
      expect(page).to_not have_content(@passenger_5.name)
    end

    within("#flight-#{@flight_5.id}") do
      within("#passenger-#{@passenger_4.id}") do
        expect(page).to have_content(@passenger_4.name)
      end
      expect(page).to_not have_content(@passenger_1.name)
    end
  end

  it 'can click remove link to remove passenger from flight and redirect back to index page' do
    within("#flight-#{@flight_2.id}") do
      within("#passenger-#{@passenger_3.id}") do
        click_button 'Remove'
      end
      expect(current_path).to eq(flights_path)
      expect(page).to_not have_content(@passenger_3.name)
    end

    within("#flight-#{@flight_5.id}") do
      within("#passenger-#{@passenger_4.id}") do
        click_button 'Remove'
      end
      expect(current_path).to eq(flights_path)
      expect(page).to_not have_content(@passenger_4.name)
    end
  end

end
