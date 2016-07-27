class ReservationMailer < ApplicationMailer
	default from: 'testandexample@gmail.com'

	def booking_email(customer, host, reservation_id)
		@customer = customer
		@host = host
		@reservation_id = reservation_id
		byebug
		mail(to: @host.email, subject: 'PairBnb Booking Confirmation')
	end
end
