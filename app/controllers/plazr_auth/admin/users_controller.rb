class PlazrAuth::Admin::UsersController < PlazrAuth::Admin::ApplicationController

  def index
    @users = PlazrAuth::User.all
  end

  def show
    @user = PlazrAuth::User.find params[:id]
    @providers = @user.authorizations.map(&:provider)

    render 'plazr_auth/users/show'
  end

  def edit
    @user = PlazrAuth::User.find params[:id]
  end

  def destroy
    PlazrAuth::User.find(params[:id]).destroy
    redirect_to :action => 'index'
  end
  
end
