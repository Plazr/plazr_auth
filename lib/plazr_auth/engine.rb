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
require 'paranoia'
require 'paranoia_uniqueness_validator'
require 'slim'

require 'pry' unless Rails.env.production?


module PlazrAuth
  def self.root
    File.expand_path '../../..', __FILE__
  end

  class Engine < ::Rails::Engine
    isolate_namespace PlazrAuth

    config.i18n.load_path += Dir[PlazrAuth::Engine.root.join('config', 'locales', '**', '*.{rb,yml}')]

    config.generators do |g|
      g.integration_tool :rspec
      g.test_framework :rspec
    end
  end

  PZA=PlazrAuth
end
