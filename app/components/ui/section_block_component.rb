module Ui
  class SectionBlockComponent < ViewComponent::Base
    def initialize(classes: nil)
      @classes = classes
    end

    def wrapper_classes
      [ "space-y-6 lg:space-y-8", @classes ].compact.join(" ")
    end
  end
end
