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
      [ "text-3xl font-semibold tracking-tight text-slate-100 sm:text-4xl lg:text-5xl", @classes ].compact.join(" ")
    end
  end
end
