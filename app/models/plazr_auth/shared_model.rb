module PlazrAuth
  
  module SharedModel
    extend ActiveSupport::Concern
	
    included do
      class_eval do
        establish_connection "users_#{Rails.env}"

		if Rails.env.production? do
			config.secondary_database_url = ENV['SECONDARY_DB_URL']
		end
      end
    end
  end

end
