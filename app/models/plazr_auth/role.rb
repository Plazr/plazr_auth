module PlazrAuth
  # Class representing the role that the registered users can have
  class Role < ActiveRecord::Base
    include PlazrAuth::SharedModel
    include PlazrAuth::ParanoiaInterface

    before_save :underscore_name

    #### Associations ####
    # role N to N user
    has_many :role_users
    has_many :users, :through => :role_users

    #### Accessors ####
    attr_accessible :name, :desc, :users
    
    # Replace spaces for underscores
    def self.underscored_role_names
      self.select(:name).map { |r| r.name.underscore }
    end

    protected

      # Replaces the name spaces for underscores
      def underscore_name
        self.name = name.underscore
      end

  end
end
