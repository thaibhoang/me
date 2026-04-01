class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes

  helper_method :current_page_meta

  private

  def set_page_meta(title:, description:, canonical: nil, image: nil, type: "website")
    @page_meta = {
      title: title,
      description: description,
      canonical: canonical || request.original_url,
      image: image || "#{request.base_url}/icon.svg",
      type: type,
      url: request.original_url
    }
  end

  def current_page_meta
    @page_meta || {
      title: "Personal Brand Platform",
      description: "Portfolio, blog, and contact page.",
      canonical: request.original_url,
      image: "#{request.base_url}/icon.svg",
      type: "website",
      url: request.original_url
    }
  end

  def track_event(name, payload = {})
    Rails.logger.info("[analytics] #{name} #{payload.to_json}")
  end
end
