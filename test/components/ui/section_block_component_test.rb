require "test_helper"

module Ui
  class SectionBlockComponentTest < ViewComponent::TestCase
    def test_wraps_content_in_section
      render_inline(SectionBlockComponent.new(classes: "mt-6")) { "Hello" }

      assert_selector "section.space-y-4.mt-6", text: "Hello"
    end
  end
end
