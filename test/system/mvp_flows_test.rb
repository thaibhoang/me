require "application_system_test_case"

class MvpFlowsTest < ApplicationSystemTestCase
  test "publish post flow appears in blog index and detail" do
    post = Post.create!(
      title: "Flow post",
      slug: "flow-post",
      excerpt: "Flow excerpt",
      content: "Flow body",
      status: :published,
      published_at: Time.current
    )

    visit blog_index_path
    assert_text post.title

    click_on post.title
    assert_current_path blog_post_path(post.slug)
    assert_text "Flow body"
  end

  test "browse project detail" do
    project = Project.create!(
      title: "Flow project",
      slug: "flow-project",
      summary: "Flow summary",
      status: :published,
      published_at: Time.current
    )

    visit projects_index_path
    click_on project.title

    assert_current_path project_path(project.slug)
    assert_text project.summary
  end

  test "submit contact form" do
    visit contact_path
    fill_in "Name", with: "System User"
    fill_in "Email", with: "system@example.com"
    fill_in "Subject", with: "System test"
    fill_in "Message", with: "Testing contact flow"
    click_on "Send message"

    assert_text "Gui lien he thanh cong."
    assert_equal 1, ContactMessage.where(email: "system@example.com").count
  end
end
