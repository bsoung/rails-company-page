module Placeholder
	extend ActiveSupport::Concern

	# now you can do "include placeholder" in the models to have access to this class method
	def self.image_generator(height:, width:)
		"http://placehold.it/#{height}x#{width}"
	end

end