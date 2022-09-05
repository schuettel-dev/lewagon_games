source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

gem "bootsnap", require: false
gem "devise"
gem "haml-rails"
gem "importmap-rails"
gem "jbuilder"
gem "omniauth-github", github: "omniauth/omniauth-github", branch: "master"
gem "omniauth-rails_csrf_protection"
gem "pagy"
gem "pg"
gem "puma"
gem "pundit"
gem "rails"
gem "redis"
gem "sprockets-rails"
gem "stimulus-rails"
gem "tailwindcss-rails"
gem "turbo-rails"
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
gem "view_component"

group :development, :test do
  gem "debug", platforms: %i[mri mingw x64_mingw]
  gem "rubocop", require: false
  gem "rubocop-minitest", require: false
  gem "rubocop-rails", require: false
  gem "rubocop-rake", require: false
end

group :development do
  gem "faker"
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end
