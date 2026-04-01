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
    @tag = Tag.create!(name: "Rails", slug: "rails")
    @post.tags << @tag
  end

  test "should get index" do
    get blog_index_url
    assert_response :success
    assert_select "title", text: "Blog | THE_ARCHITECT"
    assert_select "a[data-analytics-event='post_tag_click'][data-analytics-source='blog_index']"
  end

  test "should get show" do
    get blog_post_url(@post.slug)
    assert_response :success
    assert_select "meta[property='og:type'][content='article']"
    assert_select "a[data-analytics-event='post_tag_click'][data-analytics-source='blog_post']"
  end
end
