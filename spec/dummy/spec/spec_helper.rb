require 'rubygems'
require 'spork'

#uncomment the following line to use spork with the debugger
#require 'spork/ext/ruby-debug'

Spork.prefork do
  unless ENV['DRB']
    require 'simplecov'
    SimpleCov.root(File.expand_path '../../../..', __FILE__)
    SimpleCov.start 'rails'
  end

  ENV["RAILS_ENV"] ||= 'test'

  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'
  require 'rspec/autorun'
  require 'capybara/rspec'
  require 'factory_girl_rails'
  require 'shoulda/matchers'
  require 'database_cleaner'

  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

  RSpec.configure do |config|
    config.mock_with :rspec
    # config.mock_with :mocha

    #config.use_transactional_fixtures = true
    config.use_transactional_fixtures = false

    config.treat_symbols_as_metadata_keys_with_true_values = true
    config.filter_run focus: true # runs only :focus examples
    config.run_all_when_everything_filtered = true # runs everything if none match
    # config.fixture_path = "#{::Rails.root}/spec/fixtures"
    config.infer_base_class_for_anonymous_controllers = false
    config.order = "random"

    config.before(:suite) do
      DatabaseCleaner[:active_record,{:connection => :test}].strategy       = :truncation
      DatabaseCleaner[:active_record,{:connection => :users_test}].strategy = :truncation
    end

    config.before(:each) do
      @routes = PlazrAuth::Engine.routes

      DatabaseCleaner.start
    end

    config.after(:each) do
      DatabaseCleaner.clean
    end
  end


  OmniAuth.config.test_mode = true
  OmniAuth.config.add_mock(:facebook, {
    "uid" => "10",
    "credentials" => { "token" => "1234567890" },
    "extra" => {
      "raw_info" => {
        "email" => "mpalhas@gmail.com",
        "name" => "mpalhas",
        "link" => "naps62.github.com"
      }
    },
    "info" => { "image" => "/path/to/image" }
  })

  OmniAuth.config.mock_auth[:google] = {
    "uid" => "10",
    "credentials" => { "token" => "1234567890" },
    "info" => {
      "email" => "mpalhas@gmail.com",
      "name" => "naps62"
    }
  }

  # OmniAuth.config.mock_auth[:twitter] = {
  #   "credentials" => { "token" => "1234567890" },
  #   "extra" => {
  #     "raw_info" => {
  #       "id" => "10",
  #       "name" => "mpalhas",
  #       "link" => "naps62.github.com",
  #       "profile_link_url" => "/path/to/image"
  #     }
  #   }
  # }

end

Spork.each_run do
  # This code will be run each time you run your specs.
  if ENV['DRB']
    require 'simplecov'
    puts 'Starting simplecov on ' + SimpleCov.root(File.expand_path '../../../..', __FILE__)
    SimpleCov.start 'rails'
  end
end
