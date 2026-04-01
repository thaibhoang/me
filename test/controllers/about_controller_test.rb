require "test_helper"

class AboutControllerTest < ActionDispatch::IntegrationTest
  setup do
    profile = Profile.create!(
      full_name: "Demo User",
      headline: "Engineer",
      bio: "About demo",
      cv_url: "https://example.com/cv.pdf"
    )
    profile.skills.create!(group_name: "Backend", name: "Ruby")
  end

  test "should get show" do
    get about_url
    assert_response :success
    assert_select "title", text: "About | THE_ARCHITECT"
    assert_select "meta[property='og:title'][content='About | THE_ARCHITECT']"
    assert_select "a[data-analytics-event='resume_download'][data-analytics-source='about_cv']"
  end
end
