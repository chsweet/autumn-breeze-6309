class Airline < ApplicationRecord
  has_many :flights

  def airline_adult_passengers
    flights.joins(:passengers)
    .select('passengers.name as passenger_name')
    .where('passengers.age >= ?', 18)
    .group('passenger_name')
  end
end
