class ProjectsController < ApplicationController
  def index
    @projects = Project.published_recent
    set_page_meta(
      title: "Portfolio | THE_ARCHITECT",
      description: "Case study du an, ket qua, va cong nghe su dung."
    )
    track_event("page_view", path: request.path)
  end

  def show
    @project = Project.published.includes(:project_links, :project_visuals, :project_metrics, :project_achievements).find_by!(slug: params[:slug])
    set_page_meta(
      title: @project.meta_title.presence || @project.title,
      description: @project.meta_description.presence || @project.summary
    )
    track_event("page_view", path: request.path, project_slug: @project.slug)
  end
end
