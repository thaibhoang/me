module Ui
  class ButtonComponent < ViewComponent::Base
    STYLES = {
      primary: "rounded bg-emerald-500 px-4 py-2 text-black font-semibold cursor-pointer hover:bg-emerald-400 transition",
      secondary: "rounded border border-slate-700 px-4 py-2 text-slate-100 hover:border-emerald-500 hover:text-emerald-300 transition",
      chip: "rounded border border-slate-700 px-3 py-1 text-sm hover:border-emerald-500 hover:text-emerald-300 transition",
      chip_active: "rounded border border-emerald-700 px-3 py-1 text-sm text-emerald-300"
    }.freeze

    def initialize(label:, href: nil, variant: :primary, type: :button, classes: nil)
      @label = label
      @href = href
      @variant = variant.to_sym
      @type = type
      @classes = classes
    end

    attr_reader :label, :href, :type

    def link?
      href.present?
    end

    def button_classes
      [ STYLES.fetch(@variant, STYLES[:primary]), @classes ].compact.join(" ")
    end
  end
end
