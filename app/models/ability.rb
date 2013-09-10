class Ability
  include CanCan::Ability

    def initialize(user)
        user ||= User.new #guest user
        #can [:show ,:index], :article
        can :read, Article, Article.published do |article|
            article.published_at <= Time.now
        end
        #alias_action :create,:update,:read,:destroy, :to => :crud

        if user.role? :admin
            can :manage, :all
            cannot :delete, User, :id => user.id
            can :see_timestamps, User
        elsif user.role? :member            
            can [:read,:update], User, :id => user.id
        elsif user.role? :moderator
            can :manage, Article do |article|
                article.try(:owner)== user
            end
        end    

    end   
end
