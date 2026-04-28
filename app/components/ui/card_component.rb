module Ui
  class CardComponent < ViewComponent::Base
    renders_one :title
    renders_one :meta
    renders_one :body
    renders_one :footer

    def initialize(classes: nil, tag: :article, title_classes: nil, meta_classes: nil, body_classes: nil)
      @classes = classes
      @tag = tag
      @title_classes = title_classes
      @meta_classes = meta_classes
      @body_classes = body_classes
    end

    attr_reader :title_classes, :meta_classes, :body_classes

    attr_reader :tag

    def wrapper_classes
      [ "rounded-xl border border-slate-800/80 bg-slate-900/40 p-5 sm:p-6", @classes ].compact.join(" ")
    end
  end
end
