class ViewComponentWithOptions < ApplicationComponent
  attr_reader :options

  def initialize(options = {})
    @options = options.without(:class).with_defaults(defaults)

    if options.key?(:force_css)
      @options[:class] = options[:force_css]
    elsif options.key?(:class)
      @options[:class] << " #{options[:class]}"
    end
    super()
  end

  def defaults
    {} # override in subclass
  end
end
