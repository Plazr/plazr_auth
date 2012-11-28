#require 'generators/plazr_auth/model_helpers.rb'

module PlazrAuth
  module Generators
    class InstallGenerator < Rails::Generators::Base

      source_root File.expand_path('../templates', __FILE__)

      #
      # Actions
      #

      def template_initializers
        template 'initializer.rb', 'config/initializers/plazr_auth.rb'
      end

      def inject_seeds
        append_file "db/seeds.rb", "PlazrAuth::Engine.load_seed\n"
      end

      def inject_routes
        inject_into_file  'config/routes.rb',
                    "\n\tmount PlazrAuth::Engine => '/'",
                    :after => "Rails.application.routes.draw do\n"
      end
    end
  end
end
