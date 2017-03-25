module ApplicationHelper
	# refactor logic in our views into appropriate helper files
  # if unsure route, use rake routes | grep logout  
  # is_a? checks to make sure it's a User class from User model 
	def login_helper style = ''
		if current_user.is_a?(GuestUser) 
    	(link_to "Register", new_user_registration_path, class: style) + 
    	" ".html_safe + 
    	(link_to "Login", new_user_session_path, class: style)
    else 
    	link_to "Logout", destroy_user_session_path, method: :delete, class: style
    end
	end

	def source_helper layout_name
		if session[:source]
			greeting = "Thanks for visiting me from #{session[:source]} and you are on the #{layout_name} layout"
      content_tag(:p, greeting, class: "source-greeting")
    end
	end

	def copyright_generator
		@copyright = XiangHorseViewTool::Renderer.copyright 'Xiang Ma', 'All rights reserved'
	end

	def nav_items
		[
			{
				url: root_path,
				title: 'Home'
			},
			{
				url: about_path,
				title: 'About'
			},
			{
				url: contact_path,
				title: 'Contact'
			},
			{
				url: blogs_path,
				title: 'Blog'
			},
			{
				url: portfolios_path,
				title: 'Portfolio'
			}
		]
	end

	def nav_helper style, tag_type
		nav_links = ''

		nav_items.each do |item|
			nav_links << "<#{tag_type}><a href='#{item[:url]}' class='#{style} #{onPage? item[:url], 'active'}'>#{item[:title]}</a></#{tag_type}>"
		end

		nav_links.html_safe
	end

	# current_page? is a special method in rails - return "active" if the current page matches whatever path we passed in
	def onPage? path, style
		style if current_page? path
	end

end








