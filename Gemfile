source 'https://rubygems.org'

ruby "2.3.0"

gem 'rails', '4.2.6'
gem 'bcrypt'
gem 'elasticsearch-model'
gem 'elasticsearch-rails'
gem 'figaro'
gem 'rspec_api_documentation'

gem 'bootstrap-sass'
gem 'sass-rails'
gem 'jquery-rails'
gem 'turbolinks'

group :development, :test do
  gem 'byebug'
  gem 'sqlite3'
  gem 'spring'
end

group :development do
  gem 'database_cleaner'
end

group :test do
  gem 'coveralls', :require => false
  gem 'factory_girl_rails'
  gem 'rspec-rails', '~> 3.0'
  gem 'simplecov', :require => false
end

group :production do
  gem 'pg'
end
