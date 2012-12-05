module PlazrAuth
  
  module SharedModel
    extend ActiveSupport::Concern

    included do
      class_eval do
        establish_connection "users_#{Rails.env}"
      end
    end
  end

end
