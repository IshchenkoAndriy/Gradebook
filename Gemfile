source 'https://rubygems.org'

gem 'rails', :git => 'git://github.com/rails/rails.git', :branch => '3-2-stable'

gem "squeel"

gem "cocoon"

gem "carrierwave"
gem "mini_magick"

gem "coderay"
gem "haml-rails", ">= 0.3.5"
gem 'i18n-js'

gem 'activeadmin'

gem 'ckeditor', :git => 'git://github.com/galetahub/ckeditor.git'
gem 'nivo-rails'
gem 'highcharts-rails', '~> 3.0.0'
gem 'bootstrap-sass'
gem 'simple-navigation'
gem 'gretel'

group :development do
	gem 'webrick', '1.3.1'
	gem 'mysql2'
	
	# tune error page
	gem "better_errors"
	gem "binding_of_caller"
end

group :production do
	gem 'pg'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails', '~> 2.2.1' # 2.2.1 version need only for activeadmin
gem "rspec-rails", ">= 2.11.0", :group => [:development, :test]
gem "email_spec", ">= 1.2.1", :group => :test
gem "cucumber-rails", ">= 1.3.0", :group => :test, :require => false
gem "database_cleaner", ">= 0.8.0", :group => :test
gem "launchy", ">= 2.1.2", :group => :test
gem "capybara", ">= 1.1.2", :group => :test
gem "factory_girl_rails", ">= 4.1.0", :group => [:development, :test]

#gem "bootstrap-sass", ">= 2.1.0.0"

gem "devise", ">= 2.1.2"
gem "cancan", ">= 1.6.8"
gem "rolify", ">= 3.2.0"
gem "simple_form", ">= 2.0.3"
gem "quiet_assets", ">= 1.0.1", :group => :development

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
