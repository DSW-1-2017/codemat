class DojosController < ApplicationController
  before_action :authorize
  #protect_from_forgery

  def new
    @dojo = Dojo.new
    @themes = Theme.all
    @location = Location.new
    @video = Video.new
  end

  # create facade
  def create
    category = params[:dojo][:category].to_sym
    dojo_factory = dojos_factories[category]

    if (dojo_factory)
      @dojo = dojo_factory.create(dojo_params, current_user)
      @dojo.create_location(location_params)
    end

    if params[:video][:source]
      @url_video = params[:video][:source]
      @source = Video.extract_video_id @url_video
      embed = "http://www.youtube.com/embed/"+ @source
      @dojo.create_video(video_params.merge!(source: embed))
    end

    if @dojo.save
      theme = Theme.find dojo_params[:theme_id]
      theme.dojos << @dojo
      flash[:notice] = "Ok"
      redirect_to '/'
    else
      flash[:error] = "Not ok"
      redirect_to '/'
    end
  end

  def edit
    @dojo = Dojo.find(params[:id])
  end

  def update
  end

  def destroy
  end

  def show
    @dojo = DojoDecorator.new(Dojo.find params[:id])
  end

  private
    def dojo_params
      params.require(:dojo).permit(:user_id, :theme_id, :title, :category, :starts_at)
    end

    def location_params
      params.require(:location).permit(:address, :latitude, :longitude)
    end

    def video_params
      params.require(:video).permit(:source)
    end

    def dojos_factories
      Hash.try_convert({
        kata: DojoFactory::KataCreator,
        randori: DojoFactory::RandoriCreator
      })
    end
end
