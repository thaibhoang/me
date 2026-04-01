require "test_helper"

module Ui
  class CardComponentTest < ViewComponent::TestCase
    def test_renders_all_slots
      render_inline(CardComponent.new) do |card|
        card.with_title { "Card title" }
        card.with_meta { "Meta" }
        card.with_body { "Body content" }
        card.with_footer { "Footer content" }
      end

      assert_text "Card title"
      assert_text "Meta"
      assert_text "Body content"
      assert_text "Footer content"
    end
  end
end
