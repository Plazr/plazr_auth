require "rails"

require "rubygems"
require "devise"
require "devise_invitable"
require "devise-encryptable"
require 'omniauth'
require 'omniauth-facebook'
require 'omniauth-openid'
require 'uuidtools'
require 'cancan'
require 'slim'


module PlazrAuth
  def self.root
    File.expand_path '../../..', __FILE__
  end

  class Engine < ::Rails::Engine
    isolate_namespace PlazrAuth

    config.i18n.load_path += Dir[PlazrAuth::Engine.root.join('config', 'locales', '**', '*.{rb,yml}')]

    config.generators.integration_tool :rspec
    config.generators.test_framework :rspec


    def self.app_path
      File.expand_path '../../app', called_from
    end

    %w{controller helper model}.each do |resource|
      class_eval <<-RUBY
        def self.#{resource}_path(name)
          File.expand_path "#{resource.pluralize}/plazr_auth/\#{name}.rb", app_path
        end
      RUBY
    end
  end

end
