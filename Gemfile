source 'https://rubygems.org'
gem 'rails', '6.0.3'
gem 'railties', '6.0.3'
gem 'devise'
gem 'omniauth'
gem 'omniauth-twitter'
gem 'activeresource', require: 'active_resource'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'


group :development, :test do
  # make sure sqlite3 gem ONLY occurs inside development & test groups
  gem 'sqlite3' # use SQLite only in development and testing
  gem 'mysql2'
  gem 'test-unit'
end
group :production do
  # make sure sqlite3 gem ONLY occurs inside development & test groups
  gem 'pg' 
end
             # use PostgreSQL in production (Heroku)
gem 'rails_12factor'  # Heroku-specific production settings
# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
 gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# use Haml for templates
gem 'haml'
# use Ruby debugger
gem 'byebug'
gem 'bootstrap-sass', '~> 3.4.1'
gem 'autoprefixer-rails'
gem 'momentjs-rails', '~> 2.11', '>= 2.11.1'
