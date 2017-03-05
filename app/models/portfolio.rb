class Portfolio < ApplicationRecord

	validates_presence_of :title, :body, :main_image, :thumb_image

	# create custom scope via class method - then go to portfolio controller, index method - use portfolio.angular to see
	# pure ruby
	def self.angular
		where(subtitle: "Angular")
	end

	# or using rails and lambda
	scope :ruby_on_rails_portfolio_items, -> {where(subtitle: "Ruby on Rails")}

	# callback / set fault after creating - like if main image / thumbnail is not filled
	after_initialize :set_defaults

	# ||= shorthand for, if self.main_image == nil, then set it to that
	def set_defaults
		self.main_image ||= "http://placehold.it/600x400"
		self.thumb_image ||= "http://placehold.it/350x200"
	end
end

