source 'http://rubygems.org'

gemspec

# jquery-rails is used by the dummy application
gem 'jquery-rails'

group :development do
	gem 'awesome_print', :require => 'ap'

	# To use debugger
	gem 'execjs'
	gem 'therubyracer'
	gem 'debugger'
end

group :test do
	gem 'cucumber-rails'#, :require => false
	gem 'database_cleaner'
end

group :test, :development do
  gem 'factory_girl_rails'
  gem 'factory_girl'
end
