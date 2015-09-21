source 'https://rubygems.org'

gem 'rails', github: "rails/rails"
gem 'arel', github: "rails/arel"
gem 'rack', github: "rack/rack"
gem 'pg'

gem 'sprockets-rails', github: "rails/sprockets-rails"
gem 'sprockets', github: "rails/sprockets"
gem 'sass-rails', github: "rails/sass-rails"
gem 'uglifier', '>= 1.3.0'
#gem 'coffee-rails', github: "rails/coffee-rails"
gem 'jquery-rails'
gem 'turbolinks', github: "rails/turbolinks"

gem 'bcrypt', '~> 3.1.7'
gem 'friendly_id', '~> 5.1.0'

group :development do
  gem 'spring' # https://github.com/rails/spring
  gem 'annotate'
  gem 'brakeman', require: false
  gem 'rails-erd'
  gem 'overcommit'
  gem 'rubycritic', require: false
  gem 'web-console', github: 'rails/web-console' # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'rails_best_practices'
  # gem 'capistrano-rails'
end

group :development, :test do
  gem 'faker'
  gem 'byebug' # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'rubocop', require: false
  gem 'sandi_meter'
  gem 'rspec-rails', '~> 3.0'
  gem 'rubocop-rspec'
  gem 'factory_girl_rails'
end

group :test do
  gem 'capybara'
  gem 'simplecov', require: false
  # gem 'cucumber-rails', require: false
  gem 'database_cleaner'
  gem 'shoulda-matchers', require: false
  gem 'rspec-collection_matchers'
  gem 'codeclimate-test-reporter', require: nil
end
