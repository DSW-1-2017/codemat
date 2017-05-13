class UserControllerFacade
	attr_reader :user, :location

	def initialize(user, location)
		@user = user
		@location = location
	end

	def new_location
		@location = Location.new
	end

	def set_location(params)
		user.create_location(params)
	end
end