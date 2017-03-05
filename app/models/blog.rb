class Blog < ApplicationRecord
	# 0 is going to be mapped to draft, which is why we set a default in the blog schema to 0
	enum status: {draft: 0, published: 1}
	extend FriendlyId
  	friendly_id :title, use: :slugged

  	# validator
  	validate_presence_of :title, :body
end
