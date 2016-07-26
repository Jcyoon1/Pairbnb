class Listing < ActiveRecord::Base
	belongs_to :user
	has_many :reservations
	mount_uploaders :avatars, AvatarUploader

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
