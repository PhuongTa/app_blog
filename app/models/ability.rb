class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new #guest user

    if user.role? (:admin)
        can :manage, :all
        can :see_timestamps, User
    elsif user.role?(:member) # user.role?(:moderator) #moderator
        can :read, :all
        can :create, User
        can :update, User, :id=> user.id
        can :see_timestamps, User, :id => user.id
        #if user.role?(:moderator)
                #            
        #end
        elsif user.role?(:author)
            can :create, Article
            can :update, Article do |article|
            article.try(:user) == user
            end
        end
    # elsif user.role? (:normal)
    #     can :read, :all
    #     can :create, User
    #     can :see_timestamps, User, :id => user.id
    end
  end
end




 #can :create, Comment
        # can :update, Comment do |comment|
        #     comment.try(:user)== user || user.role? (:moderator)
        # end

        # can :update, Comment do |comment|
        #     comment.try(:user) == user || user.role?(:moderator)
        # end

