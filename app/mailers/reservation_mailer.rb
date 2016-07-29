class ReservationMailer < ApplicationMailer
	default from: 'testandexample@gmail.com'

	def booking_email(listing, reservation)
		@reservation = reservation
		@listing = listing


		mail(to: @listing.user.email, subject: 'PairBnb Booking Confirmation @listing.name') #subject invalid
	end

	def notification_email(reservation, listing)
		@reservation = reservation
		@listing = listing

		mail(to: @reservation.user.email, subject: 'PairBnb Confirmation: "Listing.find(#{id})name"') #subject invalid
	end

end

