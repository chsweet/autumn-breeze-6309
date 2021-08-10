class Flight < ApplicationRecord
  belongs_to :airline
  has_many :flight_logs
  has_many :passengers, through: :flight_logs

end
