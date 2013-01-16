class PlazrAuth::Admin::UsersController < PlazrAuth::Admin::ApplicationController

  # Get all the users registered
  def index
    @users = PlazrAuth::User.all
  end

  # Get a user with the given id
  def show
    @user = PlazrAuth::User.find params[:id]
    @providers = @user.authorizations.map(&:provider)

    render 'plazr_auth/users/show'
  end

  # Get a user with the given id to display in the edit page
  def edit
    @user = PlazrAuth::User.find params[:id]
  end

  # Delete a user with the given id
  def destroy
    PlazrAuth::User.find(params[:id]).destroy
    redirect_to :action => 'index'
  end
  
end
