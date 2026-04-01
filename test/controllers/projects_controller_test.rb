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
  end

  test "should get index" do
    get projects_index_url
    assert_response :success
  end

  test "should get show" do
    get project_url(@project.slug)
    assert_response :success
  end
end
