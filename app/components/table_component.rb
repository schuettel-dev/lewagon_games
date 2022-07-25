class TableComponent < ViewComponentWithOptions
  renders_one :header, Table::HeaderComponent
  renders_one :body, Table::BodyComponent

  def defaults
    {
      class: "min-w-full divide-y divide-gray-300"
    }
  end
end
