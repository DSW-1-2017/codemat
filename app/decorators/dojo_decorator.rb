class DojoDecorator < SimpleDelegator
  def initialize(dojo)
    @dojo = dojo
    @show_proc = define_show
    super
  end

  def render_info
    @show_proc.call
  end

  private
    def define_show
      Proc.new {
        ApplicationController.render partial: "/dojos/#{@dojo.category.downcase}",
          locals: {
            dojo: @dojo,
            video: @dojo.video
          }
      }
    end

    def define_edit
      Proc.new {
        ApplicationController.render partial: "/dojos/#{@dojo.id}/#{@dojo.category.downcase}",
          locals: {
            dojo: @dojo
          }
      }
    end
end
