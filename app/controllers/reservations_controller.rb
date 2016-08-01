class ReservationsController < ApplicationController
	before_action :set_reservation, only: [:show, :edit, :update, :destroy]

	# GET /reservations
	def index
		@reservations = Reservation.all
	end

	# GET /reservations/1
	def show
	end

	# GET /reservations/new
	def new
		@reservation = Reservation.new
		@listing = Listing.find(params[:listing_id])
	end

	# GET /reservations
	def edit
	end

	# POST /reservations
	def create
		@reservation = Reservation.new(reservation_params) 
		@listing = @reservation.listing
		if (@reservation.reserved_dates & @listing.blocked_dates).empty? && @reservation.save
			flash[:notice]= "successful"
			# Tell the ReservationMailer to send a booking email after save
			ReservationMailer.delay.booking_email(@listing, @reservation)
			ReservationMailer.delay.notification_email(@reservation, @listing)
			#ReservationJob.perform_later(@listing, @reservation)
			redirect_to @listing
		else
			flash[:notice]= "unsuccessful"
			redirect_to @listing
		end

	end

	# PATCH/PUT /reservations/1
	def update
		@reservation.update(reservation_params)
	end

	# DELETE /reservations/1
	def destroy
		@reservation.destroy
	end

	private
	# Use callbacks to share common setup or constraints between actions	
	def set_reservation
		@reservation = Reservation.find(params[:id])
	end

	def reservation_params
		params.require(:reservation).permit(:listing_id, :user_id, :start_date, :end_date)
	end

end





