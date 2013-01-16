#require_dependency "plazr_auth/application_controller"

module PlazrAuth

  class UsersController < PlazrAuth::ApplicationController
    load_and_authorize_resource :class => 'PlazrAuth::User'

    def index
    end

    # Get a user with the given id and its providers
    def show
      @user = PlazrAuth::User.find params[:id]
      @providers = @user.authorizations.map(&:provider)
    end

    # Get the providers with the current users
    def profile
      @user = current_user
      @providers = @user.authorizations.map(&:provider)
      render :show
    end

  end
end
