Rails.application.routes.draw do
	
	root :to => "plazr_auth/users#index"

	mount PlazrAuth::Engine => "/"
end
