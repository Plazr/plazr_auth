class UsersController < ApplicationController

	def index
		@users = PlazrAuth::User.all
	end

	def show
		@user = PlazrAuth::User.find_by_id(params[:id])
		logger.debug @user.inspect
	end
end
