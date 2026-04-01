module Ui
  class SectionBlockComponent < ViewComponent::Base
    def initialize(classes: nil)
      @classes = classes
    end

    def wrapper_classes
      [ "space-y-4", @classes ].compact.join(" ")
    end
  end
end
