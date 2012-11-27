class PlazrAuth::Admin::ApplicationController < PlazrAuth::ApplicationController
  protect_from_forgery

  def current_ability
    PlazrAuth::Ability.new(current_user)
  end
end
