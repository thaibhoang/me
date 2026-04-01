module Ui
  class ButtonComponent < ViewComponent::Base
    STYLES = {
      primary: "inline-flex items-center justify-center rounded-full bg-emerald-400 px-5 py-3 text-xs font-semibold uppercase tracking-widest text-slate-950 transition hover:bg-emerald-300 sm:px-6 sm:py-3.5",
      secondary: "inline-flex items-center justify-center rounded-full border border-slate-700 px-5 py-3 text-xs font-semibold uppercase tracking-widest text-slate-100 transition hover:border-emerald-500 hover:text-emerald-300 sm:px-6 sm:py-3.5",
      chip: "inline-flex items-center justify-center rounded-full border border-slate-700 bg-slate-900/60 px-3 py-1.5 text-xs text-slate-200 transition hover:border-emerald-500 hover:text-emerald-300 sm:px-4 sm:py-2",
      chip_active: "inline-flex items-center justify-center rounded-full border border-emerald-700 bg-emerald-900/20 px-3 py-1.5 text-xs text-emerald-300 sm:px-4 sm:py-2"
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
