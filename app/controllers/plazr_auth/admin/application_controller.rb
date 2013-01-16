class PlazrAuth::Admin::ApplicationController < PlazrAuth::ApplicationController
  protect_from_forgery

  # Defines the abilities for the current user
  def current_ability
    PlazrAuth::Ability.new(current_user)
  end
end
