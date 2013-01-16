# author Naps62
module PlazrAuth
  # Class representing the user
  class User < ActiveRecord::Base
    include PlazrAuth::SharedModel
    include PlazrAuth::ParanoiaInterface

    #### Devise ####

    #include PlazrAuth::Models::UserConcern
    devise  :database_authenticatable,
            :registerable,
            :encryptable,
            :recoverable,
            :rememberable,
            :trackable,
            :validatable,
            :omniauthable#,
            #:confirmable

    devise  :encryptor => :sha1

    #### Associations ####
    has_many :authorizations, :dependent => :destroy

    # user N to N roles
    has_many :role_users
    has_many :roles, :through => :role_users

    attr_accessible :first_name,
                    :last_name,
                    :email,
                    :password,
                    :password_confirmation,
                    :remember_me,
                    :roles,
                    :confirmed_at

    ## Callbacks ##
    after_commit :add_user_role

    # Get the full name of the user
    def name
      full_name = "#{first_name} #{last_name}".strip
      if full_name.size > 0
        full_name
      else
        email
      end
    end

    # Check if the user has the given role
    def role?(role)
      self.roles.where(:name => role).any?
    end

    def to_s
      name
    end

    def method_missing(method_name, *args, &block)
      if method_name.to_s =~ /^is_(.*)\?$/ && PZA::Role.underscored_role_names.include?($1)
        self.class.send :define_method, method_name do
          self.role?($1)
        end
        self.send method_name
      else
        super
      end
    end

    protected

      # Add the user role
      def add_user_role
        self.roles << Role.find_by_name('user') unless self.roles.any?
        #user_role = Role.find_by_name('user')
        #self.role_users << RoleUser.find_or_create_by_user_id_and_role_id(self.id, role.id) if self.roles.size == 0
      end

  end
end
