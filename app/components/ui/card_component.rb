module Ui
  class CardComponent < ViewComponent::Base
    renders_one :title
    renders_one :meta
    renders_one :body
    renders_one :footer

    def initialize(classes: nil, tag: :article)
      @classes = classes
      @tag = tag
    end

    attr_reader :tag

    def wrapper_classes
      [ "rounded border border-slate-800 p-4", @classes ].compact.join(" ")
    end
  end
end
