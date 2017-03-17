module SetSource
	extend ActiveSupport::Concern

	included do
		before_action :set_source
	end

	# special queue stored in session - access with ?q=twitter after url
	def set_source
		session[:source] = params[:q] if params[:q]
	end
end