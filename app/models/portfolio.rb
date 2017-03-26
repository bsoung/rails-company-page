class Portfolio < ApplicationRecord
	has_many :technologies

	# nested attributes, encapsulating a lamda process that says do not accept this if attrs name is blank
	# when testing on console, refer to technologies_attributes - strict name!
	# technologies_attributes: [{name: 'wef'}, {name: 'wefw'}, {name: 'ewf'}]    <-- notice you must pass in an array containg hashes
	accepts_nested_attributes_for :technologies, 
	reject_if: lambda { |attrs| attrs['name'].blank? }

	include Placeholder

	validates_presence_of :title, :body, :main_image, :thumb_image

	# create custom scope via class method - then go to portfolio controller, index method - use portfolio.angular to see
	# pure ruby
	def self.angular
		where(subtitle: "Angular")
	end

	def self.by_position
		order("position ASC")
	end

	# or using rails and lambda
	scope :ruby_on_rails_portfolio_items, -> {where(subtitle: "Ruby on Rails")}

	# callback / set fault after creating - like if main image / thumbnail is not filled
	after_initialize :set_defaults

	# ||= shorthand for, if self.main_image == nil, then set it to whatever inside if block
	def set_defaults
		self.main_image ||= Placeholder.image_generator(height: '600', width: '400')
		self.thumb_image ||= Placeholder.image_generator(height: '350', width: '200')
	end
end

