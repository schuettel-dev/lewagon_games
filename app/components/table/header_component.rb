class Table::HeaderComponent < ViewComponent::Base
  renders_many :columns, "ColumnComponent"

  class ColumnComponent < ViewComponentWithOptions
    def defaults
      {
        class: "whitespace-nowrap p-4 text-left text-sm font-semibold text-gray-900 text-xl"
      }
    end

    def call
      tag.th(content, **@options)
    end
  end
end
