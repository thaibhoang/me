class HomeController < ApplicationController
  def index
    @featured_projects = Project.published.where(featured: true).limit(3)
    @latest_posts = Post.published_recent.limit(3)
    set_page_meta(
      title: "THE_ARCHITECT | Senior Software Engineer",
      description: "Portfolio, bai viet ky thuat, va kenh lien he hop tac."
    )
    track_event("page_view", path: request.path)
  end

  def sitemap
    @posts = Post.published
    @projects = Project.published
    render layout: false
  end
end
