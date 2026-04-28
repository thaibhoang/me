class ProjectsController < ApplicationController
  def index
    @tags = Tag.joins(:projects).where(projects: { status: :published }).distinct.order(:name)
    @projects = Project.published_recent.includes(:tags)
    @projects = @projects.joins(:tags).where(tags: { slug: params[:tag] }).distinct if params[:tag].present?
    set_page_meta(
      title: "Portfolio | THE_ARCHITECT",
      description: "Case study du an, ket qua, va cong nghe su dung."
    )
    track_event("page_view", path: request.path, tag: params[:tag])
  end

  def show
    @project = Project.published.includes(:project_links, :project_visuals, :project_metrics, :project_achievements, :tags).find_by!(slug: params[:slug])
    set_page_meta(
      title: @project.meta_title.presence || @project.title,
      description: @project.meta_description.presence || @project.summary
    )
    track_event("page_view", path: request.path, project_slug: @project.slug)
  end
end
