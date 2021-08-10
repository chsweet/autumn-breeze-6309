class Passenger < ApplicationRecord
  has_many :flight_logs
  has_many :flights, through: :flight_logs
end
