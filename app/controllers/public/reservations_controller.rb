class Public::ReservationsController < ApplicationController
  before_action :authenticate_user!

  def new
    # @reservation.name = current_user.name
    @instructor = Instructor.find(params[:instructor_id])
    @reservation = @instructor.reservations.build
  end

  def verification
    @instructor = Instructor.find(params[:reservation][:instructor_id])
    # @instructor　= Instructor.find(params[:id])
    # @reservation.name = current_user.name
    @reservation = Reservation.new(reservation_params)
  end

  def create
    @reservation = current_user.reservations.new(reservation_params)
    @reservation.save
    redirect_to reservations_done_path
  end

  def index
    @reservations = Reservation.all
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def done
  end

  private

  def reservation_params
    params.require(:reservation).permit(:date, :begin_time, :finish_time, :instructor_id)
  end
end
