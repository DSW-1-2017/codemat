class UsersController < ApplicationController
  #protect_from_forgery

  def new
  	@user = User.new
    @location = Location.new
  end

  def create
  	user = User.new(user_params)
    user.create_location(location_params)

  	if user.save
  		session[:user_id] = user.id
  		redirect_to theme_dojos_path
  	else
  		redirect_to 'signup'
  	end

  end

  def update
    if current_user.update_attributes(user_params)
      flash[:notice] = "Ok"
    else
      flash[:notice] = "not ok"
    end
  end

  private
  def user_params
  	params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  def location_params
    params.require(:location).permit(:address, :latitude, :longitude)
  end
end
