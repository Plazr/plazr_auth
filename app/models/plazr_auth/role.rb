module PlazrAuth
  class Role < ActiveRecord::Base
    include PlazrAuth::SharedModel

    #### Associations ####
    # role N to N user
    has_many :role_users
    has_many :users, :through => :role_users

    #### Accessors ####
    attr_accessible :name, :desc, :users
    
  end
end
