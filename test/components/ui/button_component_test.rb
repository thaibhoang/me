require "test_helper"

module Ui
  class ButtonComponentTest < ViewComponent::TestCase
    def test_renders_link_variant
      render_inline(ButtonComponent.new(label: "Read", href: "/blog", variant: :secondary))

      assert_selector "a", text: "Read"
      assert_selector "a.rounded.border.border-slate-700"
    end

    def test_renders_button_variant
      render_inline(ButtonComponent.new(label: "Send", variant: :primary, type: :submit))

      assert_selector "button[type='submit']", text: "Send"
      assert_selector "button.bg-emerald-500"
    end
  end
end
