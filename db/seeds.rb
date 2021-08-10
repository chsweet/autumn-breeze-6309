# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

FlightLog.destroy_all
Flight.destroy_all
Passenger.destroy_all
Airline.destroy_all

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

FlightLog.create!(flight: @flight_1, passenger: @passenger_2)
FlightLog.create!(flight: @flight_1, passenger: @passenger_4)
FlightLog.create!(flight: @flight_2, passenger: @passenger_3)
FlightLog.create!(flight: @flight_2, passenger: @passenger_4)
FlightLog.create!(flight: @flight_3, passenger: @passenger_1)
FlightLog.create!(flight: @flight_3, passenger: @passenger_2)
FlightLog.create!(flight: @flight_3, passenger: @passenger_4)
FlightLog.create!(flight: @flight_4, passenger: @passenger_4)
FlightLog.create!(flight: @flight_4, passenger: @passenger_5)
FlightLog.create!(flight: @flight_5, passenger: @passenger_4)
FlightLog.create!(flight: @flight_5, passenger: @passenger_5)
