class Page < ActiveRecord::Base

	def options
		Page.where(:parent_id=>id).limit(2)
	end

	def end_of_road?
		conclusion?
	end
end