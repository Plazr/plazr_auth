module PlazrAuth
  # Class for representing the relation between the user and role models
  class RoleUser < ActiveRecord::Base
    include PlazrAuth::SharedModel
    include PlazrAuth::ParanoiaInterface

    # N to N link model

    #### Relations ####

    belongs_to :user
    belongs_to :role

    #### Accessors ####
    attr_accessible :role, :user

    #### Validators ####
    validates_uniqueness_of :user_id, :scope => :role_id
  end
end
