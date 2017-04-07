source 'https://rubygems.org'

ruby '2.3.1'

gem 'rails', '5'  # Bundle edge Rails instead: gem 'rails', github: 'rails/rails'

gem 'coffee-script'
gem 'therubyracer'
gem 'sass-rails', '>= 5.0.6'

gem 'less-rails', '~> 2.8.0'
gem 'bootstrap-sass'
gem 'uglifier', '>= 1.3.0'  # Use Uglifier as compressor for JavaScript assets

gem 'jquery-rails' # Use jquery as the JavaScript library
gem 'jbuilder', '~> 2.0' # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'sdoc', '~> 0.4.0', group: :doc # bundle exec rake doc:rails generates the API under doc/api.

gem 'bcrypt', '~> 3.1.7'
gem 'devise', '~> 4.2.0'

gem 'turbolinks', '~> 5'

gem 'will_paginate', '~> 3.1', '>= 3.1.5'
gem 'bootstrap-will_paginate', '~> 0.0.10'

group :development, :test do
  gem 'byebug'  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'sqlite3' # Use sqlite3 as the database for Active Record
  gem 'haml'
  gem 'haml-rails'
  gem 'simple_form'
  gem 'cocoon'
  gem 'nokogiri' # required for minitest-have_tag
  # minitest I put in previously
  # gem 'minitest', '~> 5.10', '>= 5.10.1'
  # this two are extras included in minitest-rails-capybara from earlier
  # gem 'minitest-rails'
  # gem 'minitest-capybara'
  gem 'minitest-color'
  gem 'guard', '~>2.14'
  gem 'guard-minitest'
  gem 'rails-controller-testing'
  gem 'faker'
  gem 'hihi'
 # gem 'minitest-have_tag' #html checking for mini test...include/require in spechelper too
end

group :test do
  gem 'minitest-rails-capybara'
end

group :production do
  gem 'pg', '0.18.4'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end
