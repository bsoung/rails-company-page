module DefaultPageContent
	extend ActiveSupport::Concern

	included do 
		before_filter :set_page_defaults
	end

	def set_page_defaults
		@page_title = "Xiang Horse | Landing Page"
		@seo_keywords = "Xiang Horse beijing startup"
	end
end