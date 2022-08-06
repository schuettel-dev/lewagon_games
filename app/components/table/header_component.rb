class Table::HeaderComponent < ViewComponent::Base
  renders_many :columns, "ColumnComponent"

  class ColumnComponent < ViewComponentWithOptions
    def defaults
      {
        class: "whitespace-nowrap p-4 text-left font-semibold text-gray-900"
      }
    end

    def call
      tag.th(content, **@options)
    end
  end
end
