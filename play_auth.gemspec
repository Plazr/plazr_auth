$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'plazr_auth/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'plazr_auth'
  s.version     = PlazrAuth::VERSION
  s.authors     = ['Miguel Palhas']
  s.email       = ['mpalhas@gmail.com']
  #s.homepage    = 'TODO'
  s.summary     = 'Handling of user management and user authentication for the Plazr system'
  s.description = 'Plazr user management engine'

  s.files = Dir['{app,config,db,lib}/**/*'] + ['MIT-LICENSE', 'Rakefile', 'README.rdoc']
  s.test_files = Dir['test/**/*']

  s.add_dependency 'rails', '~> 3.2.7'

  s.add_dependency 'devise',             '>= 2.0.4'
  s.add_dependency 'devise-encryptable', '>= 0.1.1'
  s.add_dependency 'devise_invitable',   '>= 1.0.0'
  s.add_dependency 'oa-oauth'
  s.add_dependency 'omniauth',           '~> 1.0.2'
  s.add_dependency 'omniauth-facebook',  '~> 1.2.0'
  s.add_dependency 'omniauth-openid',    '~> 1.0.1'
  s.add_dependency 'omniauth-twitter'
  s.add_dependency 'uuidtools',          '>= 2.1.2'
  s.add_dependency 'uuidtools',          '>= 2.1.2'
  s.add_dependency 'cancan',             '>= 1.6.8'
  s.add_dependency 'factory_girl_rails', '~> 4.0'
  s.add_dependency 'slim-rails'
  s.add_dependency 'paranoia'
  s.add_dependency 'paranoia_uniqueness_validator'


  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'factory_girl_rails'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'shoulda-matchers'
  s.add_development_dependency 'guard-rspec'
  s.add_development_dependency 'guard-spork'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency "database_cleaner"

  # Mac specific gems
  if RUBY_PLATFORM =~ /darwin/i
    s.add_development_dependency 'rb-fsevent'
    s.add_development_dependency 'growl'
  end

  # Linux specific gems
  if RUBY_PLATFORM =~ /linux/i
    s.add_development_dependency 'rb-inotify'
    s.add_development_dependency 'libnotify'
  end
end
