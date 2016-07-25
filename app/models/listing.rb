class Listing < ActiveRecord::Base
	belongs_to :user
	has_many :reservations


	def blocked_dates
		dates = []
		self.reservations.each do |r| 
			r.reserved_dates.each do |d|
				dates << d
			end
		end
	return dates
	end

end
