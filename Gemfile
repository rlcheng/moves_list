source 'https://rubygems.org'

ruby "2.3.0"

gem 'rails', '5.0.2'
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
  gem 'rspec-rails', '~> 3.5.0'
  gem 'rails-controller-testing'
  gem 'simplecov', :require => false
end

group :production do
  gem 'pg'
  gem 'puma'
  gem 'uglifier'
end
