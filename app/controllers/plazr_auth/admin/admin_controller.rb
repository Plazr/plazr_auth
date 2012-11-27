class PlazrAuth::Admin::AdminController < PlazrAuth::Admin::ApplicationController
  authorize_resource :class => 'PlazrAuth::User'

  def index
  end
  
end
