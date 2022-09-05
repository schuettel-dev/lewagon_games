class Table::BodyComponent < ViewComponentWithOptions
  renders_many :rows, Table::Body::RowComponent

  def defaults
    {
      class: "divide-y divide-gray-200 bg-white"
    }
  end
end
