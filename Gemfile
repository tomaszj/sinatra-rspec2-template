source 'http://rubygems.org'

gem "sinatra"
gem "rack-test"
gem "i18n"
gem "datamapper"

group :development, :test do
  gem "dm-sqlite-adapter"
  gem "sqlite3"
end

group :production do
  gem "pg"
  gem "dm-postgres-adapter"
end

group :test do
  gem "rspec"
  gem "capybara"
  gem "autotest"
  # gem "autotest-growl" # Mac OS X only
  gem "autotest-fsevent" # Mac OS X only
  gem "factory_girl"
  gem "database_cleaner"
end