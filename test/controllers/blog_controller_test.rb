require "test_helper"

class BlogControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = Post.create!(
      title: "Post demo",
      slug: "post-demo",
      excerpt: "Excerpt",
      content: "Body",
      status: :published,
      published_at: Time.current
    )
  end

  test "should get index" do
    get blog_index_url
    assert_response :success
  end

  test "should get show" do
    get blog_post_url(@post.slug)
    assert_response :success
  end
end
