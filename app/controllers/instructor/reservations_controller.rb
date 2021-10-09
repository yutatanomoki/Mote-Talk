class Instructor::ReservationsController < ApplicationController
  def index
    @reservations = Reservation.page(params[:page])
  end

  def show
    @reservation = Reservation.find(params[:id])
  end
end
