require "test_helper"

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project = Project.create!(
      title: "Project demo",
      slug: "project-demo",
      summary: "Summary",
      status: :published,
      published_at: Time.current
    )
    @project.project_links.create!(kind: "live", label: "Live demo", url: "https://example.com", position: 1)
  end

  test "should get index" do
    get projects_index_url
    assert_response :success
    assert_select "title", text: "Portfolio | THE_ARCHITECT"
  end

  test "should get show" do
    get project_url(@project.slug)
    assert_response :success
    assert_select "meta[property='og:type'][content='website']"
    assert_select "a[data-analytics-event='project_outbound_click'][data-analytics-source='project_links']"
  end
end
