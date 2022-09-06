class Heroicon
  def initialize(icon)
    @icon = icon.to_s
  end

  def call
    Rails.root.join("./app/assets/images/icons/heroicons/", filename).read.html_safe # rubocop:disable Rails/OutputSafety
  end

  private

  def filename
    Pathname.new(@icon).sub_ext(".svg")
  end
end
