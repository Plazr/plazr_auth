class PlazrAuth::ApplicationController < ::ApplicationController

    def resource_name
      :user
    end

    def resource
      @resource ||= PlazrAuth::User.new
    end

    def devise_mapping
      @devise_mapping ||= Devise.mappings[:user]
    end

    def current_ability
      PlazrAuth::Ability.new(current_user)
    end

  end
