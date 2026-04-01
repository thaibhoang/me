require "test_helper"

class PostTest < ActiveSupport::TestCase
  test "requires required fields" do
    post = Post.new

    assert_not post.valid?
    assert_includes post.errors[:title], "can't be blank"
    assert_includes post.errors[:slug], "can't be blank"
  end

  test "supports published scope via enum" do
    published = Post.create!(
      title: "Published",
      slug: "published-post",
      excerpt: "Excerpt",
      content: "Content",
      status: :published,
      published_at: Time.current
    )
    Post.create!(
      title: "Draft",
      slug: "draft-post",
      excerpt: "Excerpt",
      content: "Content",
      status: :draft
    )

    assert_includes Post.published, published
    assert_equal 1, Post.published.count
  end
end
