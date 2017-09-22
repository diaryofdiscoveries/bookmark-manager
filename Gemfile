source "https://rubygems.org"

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

ruby '2.4.0'

gem 'rake'
gem 'sinatra'
gem 'thin'
gem 'data_mapper'
gem 'dm-postgres-adapter'
gem 'pg'
gem 'bcrypt'
gem 'sinatra-flash'

group :test do
  gem 'capybara'
  gem 'rspec'
  gem 'rubocop'
  gem 'simplecov', require: false
  gem 'simplecov-console', require: false
  gem 'database_cleaner'
end
