# author Naps62
module PlazrAuth
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


    def name
      full_name = "#{first_name} #{last_name}".strip
      if full_name.size > 0
        full_name
      else
        email
      end
    end

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

  end
end
