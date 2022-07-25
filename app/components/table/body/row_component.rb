class Table::Body::RowComponent < ViewComponentWithOptions
  renders_many :columns, "ColumnComponent"

  class ColumnComponent < ViewComponentWithOptions
    def defaults
      {
        class: "whitespace-nowrap p-4 text-sm text-gray-500 text-xl"
      }
    end

    def call
      tag.td(content, **options)
    end
  end
end
