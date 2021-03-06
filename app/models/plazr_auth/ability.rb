module PlazrAuth
  class Ability
    include CanCan::Ability

    def initialize(user)
      user ||= PlazrAuth::User.new
      unregistered

      user.roles.each { |role| send role.name.downcase }

      can :read, :all
    end

    #### ROLES ####

    def unregistered

    end


    def user
      #can :profile, PlazrAuth::User
      # TODO fix this
      can :manage, :all
    end


    def admin
      can :manage, :all
    end


    def method_missing(method, *args, &block)
    	if method =~ /admin\_([0-9]+)/
    	  return
    	else
    	  super
    	end
    end

  end
end
