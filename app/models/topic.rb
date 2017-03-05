class Topic < ApplicationRecord
	validates_presence_of :title

	# tell topic model that it has many blogs (after migration)
	has_many :blogs
end
