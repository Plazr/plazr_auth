source 'http://rubygems.org'

gemspec

# jquery-rails is used by the dummy application
gem 'jquery-rails'

gem 'pry-rails'

group :production do
  gem 'mysql2'
end

group :development, :test do
  gem 'rb-fsevent', require: false
  gem 'growl',      require: false
  gem 'rb-inotify', require: false
  gem 'libnotify',  require: false
end
