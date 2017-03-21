class GuestUser < User 
	# provides getters and setters - the ability for this class to have data
	attr_accessor :name, :first_name, :last_name, :email
end