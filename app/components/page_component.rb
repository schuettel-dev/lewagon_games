class PageComponent < ApplicationComponent
  renders_one :heading, PageHeadingComponent
  renders_one :actions
  renders_one :body
end
