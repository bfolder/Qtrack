class Ability
  include CanCan::Ability

  def initialize(user)
    case user.role?
      when :admin
        can :manage, :all
      when :user
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