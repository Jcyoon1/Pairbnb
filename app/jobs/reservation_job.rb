# class ReservationJob < ActiveJob::Base
# 	# Set queue as default
# 	queue_as :default

# 	def perform_later(listing, reservation)
# 		@listing = listing
# 		@reservation = reservation
# 		# Tell the ReservationMailer to send a booking email after save
# 		ReservationMailer.booking_email(@listing, @reservation).deliver_now
# 		ReservationMailer.notification_email(@reservation, @listing).deliver_now
# 	end
# end

# ReservationJob.perform_later(Listing.last, Reservation.last)