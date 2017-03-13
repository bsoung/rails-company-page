class ApplicationController < ActionController::Base
	# master controller for entire app
	include DeviseWhitelist

  protect_from_forgery with: :exception
end
