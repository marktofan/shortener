source 'https://rubygems.org'

gem 'rails', '3.2.9'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'mysql2'
gem "friendly_id", "~> 4.0.1"
gem 'simple_form'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end
gem 'bootstrap-sass', '~> 2.2.1.1'

gem 'jquery-rails'
gem 'jquery-validator'
gem "jquery-validation-rails"
#gem 'client_side_validations'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'

gem "will_paginate", "~> 3.0.3"

gem "haml-rails"
gem 'devise'
gem "cancan"

gem "decent_exposure"
gem "ransack"

gem 'strong_parameters'


group :development do

  gem 'whenever', :require => false

  gem 'rack-mini-profiler'
  gem 'brakeman'
  gem "rails_best_practices"

  #http://xpressivecode.com/2012/2/9/rails-rake-task-for-html2haml.aspx
  #rake -T | grep haml
  ##rake erb:to:haml
  gem 'hpricot'
  gem 'ruby_parser'

end

group :test, :development do
  gem "rspec-rails", "~> 2.0"
  gem "webrat"
  gem 'factory_girl_rails'
  gem 'spork'

  gem "awesome_print"

end

group :test do
  gem 'sqlite3'

end