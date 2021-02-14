class Public::ReservationsController < ApplicationController
  before_action :authenticate_user!
    
    
    def new
        @reservation.name = current_user.name
        
        @reservation = Reservation.new
    end
    def verification
    @reservation.name = current_user.name
    @reservation = Reservation.new
    end
    def create
        # binding.pry
        @reservation = current_user.reservation.new(reservation_params)
        @reservation.save
        redirect_to reservationss_done_path
    end
    
    def show
        @reservation = Reservation.find(params[:id])
    end

    def index
        @reservations = Reservation.all
    end

    def done
    end

    private
  def order_params
  params.require(:reservation).permit(:postcode, :billing_amount, :name, :address )
  end
end
