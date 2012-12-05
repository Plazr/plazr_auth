module ActiveRecord
  class Secondary < ActiveRecord::Base
    if Rails.env.production? do
		url = URI.parse( MyApp::Application.config.secondary_database_url )
    	establish_connection(
      		:adapter  => 'mysql',
      		:host     => url.host,
      		:username => url.userinfo.split(':')[0],
      		:password => url.userinfo.split(':')[1],
      		:database => url.path[1..-1],
      		:port     => url.port || 3306
    	)
	end
  end

  class SecondaryMigration < ActiveRecord::Migration
    def connection
      ActiveRecord::Secondary.connection 
    end
  end

end
