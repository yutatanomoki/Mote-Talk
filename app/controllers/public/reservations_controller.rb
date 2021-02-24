class Public::ReservationsController < ApplicationController
  before_action :authenticate_user!


    def new
        #@reservation.name = current_user.name
        @reservation = Reservation.new
    end

    def verification

    #@instructor　= Instructor.find(params[:id])
    #@reservation.name = current_user.name
    @reservation = Reservation.new(reservation_params)
    end

    def create
        @reservation = current_user.reservation.new(reservation_params)
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
  def order_params
  params.require(:reservation).permit(:date, :begin_time, :finish_time )
  end
end
