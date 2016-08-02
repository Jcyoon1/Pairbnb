class Reservation < ActiveRecord::Base
	belongs_to :listing
	belongs_to :user
	has_one :payment

	def reserved_dates
		(self.start_date..self.end_date).to_a
	end

	def total_price
		price = (self.end_date - self.start_date) * listing.price
	end

end
