source 'https://rubygems.org'

gem 'rake'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.11.1'
gem 'devise', '~> 4.7.1'
gem 'rails_admin'
ruby '2.6.5'
gem 'spring'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'

group :production do
  gem 'pg'
  gem 'rails_12factor'
  gem 'puma'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'sqlite3', '~> 1.3.11'
  gem 'byebug'
  gem 'rspec-rails'
  gem 'factory_bot_rails'
  gem 'simplecov'
  gem 'simplecov-console'
  gem 'shoulda-matchers'
  # gem 'capybara'
  # gem 'launchy'
  gem 'database_cleaner'
  gem 'cypress-on-rails', '~> 1.0'
  gem 'webpacker', '~> 4.x'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
  gem 'autoprefixer-rails'
  gem 'sdoc', '~> 0.4.0', group: :doc
end
