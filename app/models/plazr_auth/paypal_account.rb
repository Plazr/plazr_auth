module PlazrAuth
  # Class representing the paypal information needed by the user
  class PaypalAccount < ActiveRecord::Base
    include PlazrAuth::SharedModel
    include PlazrAuth::ParanoiaInterface
    
    attr_accessible :store_id,
                    :api_password, 
                    :api_username, 
                    :signature
                    
  end
end
