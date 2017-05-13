class DashboardFacade
  attr_reader :dojo, :video

  def initialize(dojo)
    @dojo = dojo
  end

  def video_from_dojo
    @video = dojo.video
  end
end
