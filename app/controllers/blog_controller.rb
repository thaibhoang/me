class BlogController < ApplicationController
  def index
    @categories = Category.order(:name)
    @tags = Tag.order(:name)
    @posts = Post.published_recent
    @posts = @posts.where(category: Category.find_by(slug: params[:category])) if params[:category].present?
    @posts = @posts.joins(:tags).where(tags: { slug: params[:tag] }).distinct if params[:tag].present?

    set_page_meta(
      title: "Blog | THE_ARCHITECT",
      description: "Chia se kien truc he thong, backend, va van hanh san pham."
    )
    track_event("page_view", path: request.path, category: params[:category], tag: params[:tag])
  end

  def show
    @post = Post.published.find_by!(slug: params[:slug])
    set_page_meta(
      title: @post.meta_title.presence || @post.title,
      description: @post.meta_description.presence || @post.excerpt,
      type: "article"
    )
    track_event("page_view", path: request.path, post_slug: @post.slug)
  end
end
