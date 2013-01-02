module PlazrAuth
  
  module SharedModel
    extend ActiveSupport::Concern
    include PlazrAuth::ParanoiaInterface
	
    included do
	class_eval do
	  if RAILS.env.production?
	ActiveRecord::Base.establish_connection( {
					:adapter => 'mysql2',
					:host => 'plazrshared.c8eex9xfeq0r.eu-west-1.rds.amazonaws.com',
					:user => 'plazr',
					:password => 'plazrplazr',
					:database => 'plazrshared'
					})
	   else
        establish_connection "users_#{Rails.env}"
       end
	  end
    end
  end

end
