class AboutController < ApplicationController
  def show
    @profile = Profile.includes(:experiences, :skills, :social_links).first
    set_page_meta(
      title: "About | THE_ARCHITECT",
      description: "Thong tin ca nhan, kinh nghiem, ky nang va CV."
    )
    track_event("page_view", path: request.path)
  end
end
