class ApplicationController < ActionController::Base
	# master controller for entire app
	protect_from_forgery with: :exception
	include DeviseWhitelist

	# TODO: refactor to concern later
	before_action :set_source

	# special queue stored in session - access with ?q=twitter after url
	def set_source
		session[:source] = params[:q] if params[:q]
	end
end
