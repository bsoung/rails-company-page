module DeviseWhitelist
	extend ActiveSupport::Concern

	included do 
		# run this method only if you receive some type of devise controller communication
		before_action :configure_permitted_parameters, if: :devise_controller?
	end

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
		devise_parameter_sanitizer.permit(:account_update, keys: [:name])
	end
end