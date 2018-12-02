class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new # guest user (not logged in)

    if user.admin?
      puts 'admin'
      can :access, :rails_admin   # grant access to rails_admin
      can :read, :dashboard       # grant access to the dashboard
      can :manage, :all
    elsif user.reviewer?
      can :read, Revarticle
      can :create, Revarticle
      can :update, Revarticle
      can :destroy, Revarticle
      can :read, Comment
      can :create, Comment
      # can :destroy, Comment
      # can :update, Revarticle do |revarticle|
      #   revarticle.try(:user) == user
      # end
      # can :destroy, Revarticle do |revarticle|
      #   revarticle.try(:user) == user
      # end
    elsif user.ori_user?
        can :read, Revarticle
        can :read, Comment
        # end
    else
      can :read, Revarticle
      can :read, Comment
    end
    # puts '---- initialize -----'
    # user ||= User.new # guest user (not logged in)
    # if user.admin?
    #   can :manage, :all
    # elsif user.reviewer?
    #   can :read, Revarticle
    #   can :create, Revarticle
    #   can :update, Revarticle do |article|
    #     article.try(:user) == user
    #   end
    #   can :destroy, Revarticle do |article|
    #     article.try(:user) == user
    #   end
    #   can :read, Comment
    #   can :create, Comment
    # elsif user.user?
    #   can :read, Revarticle
    #   can :read, Comment
    #   can :create, Comment
    #   can :destroy, Comment do |article|
    #     article.try(:user) == user
    #   end
    # else
    #   can :read, Revarticle
    #   can :read, Comment
    # end
    #
    #
    #
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
