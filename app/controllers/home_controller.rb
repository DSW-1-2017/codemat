class HomeController < ApplicationController
  def index
      if current_user
      	redirect_to theme_dojos_path
      end
  end
end
