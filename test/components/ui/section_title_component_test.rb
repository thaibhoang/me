require "test_helper"

module Ui
  class SectionTitleComponentTest < ViewComponent::TestCase
    def test_renders_heading_and_subtitle
      render_inline(SectionTitleComponent.new(title: "Blog", subtitle: "Latest posts", level: 1))

      assert_selector "h1", text: "Blog"
      assert_selector "p", text: "Latest posts"
    end
  end
end
