class ApplicationController < ActionController::Base
	# master controller for entire app
	protect_from_forgery with: :exception
	include DeviseWhitelist
	include SetSource
	include CurrentUserConcern
	include DefaultPageContent
end
