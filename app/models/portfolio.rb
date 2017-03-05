class Portfolio < ApplicationRecord

	validates_presence_of :title, :body, :main_image, :thumb_image

	# create custom scope via class method - then go to portfolio controller, index method - use portfolio.angular to see
	# pure ruby
	def self.angular
		where(subtitle: "Angular")
	end

	# or using rails and lambda
	scope :ruby_on_rails_portfolio_items, -> {where(subtitle: "Ruby on Rails")}
end
