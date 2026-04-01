module Ui
  class SectionTitleComponent < ViewComponent::Base
    def initialize(title:, subtitle: nil, level: 2, classes: nil)
      @title = title
      @subtitle = subtitle
      @level = level
      @classes = classes
    end

    attr_reader :title, :subtitle

    def heading_tag
      :"h#{@level}"
    end

    def heading_classes
      [ "text-2xl font-semibold", @classes ].compact.join(" ")
    end
  end
end
