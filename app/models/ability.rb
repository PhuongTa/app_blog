class Ability
  include CanCan::Ability

    def initialize(user)
        user ||= User.new #guest user

        #alias_action :create,:update,:read,:destroy, :to => :crud

        if user.role? :admin
            can :manage, :all
            cannot :delete, User, :id => user.id
            can :see_timestamps, User
        else
            #can :read, :article

            can [:read,:update], User, :id => user.id
            
        end    
    end   
end
