module PlazrAuth
  class Role < ActiveRecord::Base
    include PlazrAuth::SharedModel

    before_save :underscore_name

    #### Associations ####
    # role N to N user
    has_many :role_users
    has_many :users, :through => :role_users

    #### Accessors ####
    attr_accessible :name, :desc, :users
    
    def self.underscored_role_names
      self.select(:name).map { |r| r.name.underscore }
    end

    protected

      def underscore_name
        self.name = name.underscore
      end

  end
end
