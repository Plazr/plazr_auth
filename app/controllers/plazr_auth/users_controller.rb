#require_dependency "plazr_auth/application_controller"

module PlazrAuth

  class UsersController < PlazrAuth::ApplicationController
    load_and_authorize_resource :class => 'PlazrAuth::User'

    def index
    end

    def show
      @user = PlazrAuth::User.find params[:id]
      @providers = @user.authorizations.map(&:provider)
    end

    def profile
      @user = current_user
      @providers = @user.authorizations.map(&:provider)
      render :show
    end

  end
end
