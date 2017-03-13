class ApplicationController < ActionController::Base
	# master controller for entire app
	
	# run this method only if you receive some type of devise controller communication
	before_filter :configure_permitted_parameters, if: :devise_controller?

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
		devise_parameter_sanitizer.permit(:account_update, keys: [:name])
	end

  protect_from_forgery with: :exception
end
