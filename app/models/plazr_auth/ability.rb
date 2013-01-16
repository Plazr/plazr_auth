module PlazrAuth
  # Class representing the abilities of the user to interact with the stores
  class Ability
    include CanCan::Ability

    # Initializes the roles that the user has
    def initialize(user)
      user ||= PlazrAuth::User.new
      unregistered

      user.roles.each { |role| send role.name.downcase }

      can :read, :all
    end

    #### ROLES ####

    # Set the permissions for the unregistered user role
    def unregistered

    end

    # Set the permissions for the user role
    def user
      #can :profile, PlazrAuth::User
      # TODO fix this
      can :manage, :all
    end

    # Set the permissions for the admin role
    def admin
      can :manage, :all
    end

  end
end
