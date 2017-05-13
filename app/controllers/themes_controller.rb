class ThemesController < ApplicationController
  def index
    @themes = Themes.all
  end

  def follow
    @theme = Theme.find params[:id]

      redirect_to 'signup'

    if @theme.add_observer(current_user)
      flash[:notice] = "Ok"
    else
      flash[:notice] = "Not ok"
    end

  end

  def unfollow
    @theme = Theme.find params[:id]

    if @theme.delete_observer(current_user)
      flash[:notice] = "Ok"
    else
      flash[:notice] = "Not ok"
    end

  end

  private
    def theme_params
      param.require(:theme).permit(:id, :name)
    end
end
