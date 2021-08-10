class FlightLogsController < ApplicationController
  def destroy
    flight_log = FlightLog.find_by(flight_id: params[:flight_id], passenger_id: params[:passenger_id])

    flight_log.destroy

    redirect_to flights_path
  end
end
