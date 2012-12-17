module PlazrAuth
  class PypalAccount < ActiveRecord::Base
    include PlazrAuth::SharedModel
    
    #belongs_to :store
    
    attr_accessible :api_password, 
                    :api_username, 
                    :signature
    
  end
end
