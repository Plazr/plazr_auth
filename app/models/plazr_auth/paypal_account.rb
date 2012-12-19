module PlazrAuth
  class PaypalAccount < ActiveRecord::Base
    include PlazrAuth::SharedModel
    
    attr_accessible :store_id,
                    :api_password, 
                    :api_username, 
                    :signature
                    
  end
end
