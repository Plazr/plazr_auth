module PlazrAuth

  module SharedModel
    extend ActiveSupport::Concern
    include PlazrAuth::ParanoiaInterface

    included do
      class_eval do
	  #if Rails.env.production?
   	  #  establish_connection(
	  #			:adapter => 'mysql2',
	  #			:host => 'plazrshared.c8eex9xfeq0r.eu-west-1.rds.amazonaws.com',
	  #			:username => 'plazr',
	  #			:password => 'plazrplazr',
	  #			:database => 'plazrshared',
	  #			:port => 3306
	  #			)
	  #else
        establish_connection "users_#{Rails.env}"
      #end
	  end
    end
  end

end
