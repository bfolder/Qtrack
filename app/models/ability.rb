class Ability
  include CanCan::Ability

  def initialize(user)
    if user.is_admin?
      can :manage, :all
    end

    if user.is_user?
      can :read, [Comment, Project, Issue, User]
      can :create, [Comment, Issue]
      can :update, Issue do |issue|
        issue.try(:owner) == user
      end
      can :destroy, Comment do |comment|
        comment.try(:owner) == user
      end
    end
  end
end