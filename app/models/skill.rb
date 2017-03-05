class Skill < ApplicationRecord
	# including our helper module in the concerns folder
	include Placeholder

	validates_presence_of :title, :percent_utilized

	# callback / set fault after creating - like if main image / thumbnail is not filled
	after_initialize :set_defaults

	# ||= shorthand for, if self.main_image == nil, then set it to that
	def set_defaults
		self.badge ||= Placeholder.image_generator(height: '250', width: '250')
	end
end
