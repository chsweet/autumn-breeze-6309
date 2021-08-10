class Airline < ApplicationRecord
  has_many :flights

  def adult_passengers_order_flights
    flights.joins(:passengers)
    .select('passengers.name as passenger_name, count(flights.id) as flight_count')
    .where('passengers.age >= ?', 18)
    .group('passenger_name')
    .order(flight_count: :desc)
  end
end
