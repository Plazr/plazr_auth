class PlazrAuth::ApplicationController < ::ApplicationController
    # Get the current user name
    def resource_name
      :user
    end

    # Create a new user
    def resource
      @resource ||= PlazrAuth::User.new
    end

    def devise_mapping
      @devise_mapping ||= Devise.mappings[:user]
    end

    # Get the abilities of the current user
    def current_ability
      PlazrAuth::Ability.new(current_user)
    end

  end
