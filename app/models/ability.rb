class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.admin?
      can :manage, :all
    else
      can :read, :all
    end

    can :manage, Post do |post|
      user == post.user
    end

    can :like, Like do |like|
      user != like.post.user
    end

    can :member, Member do |member|
      user != member.post.user
    end

    #
    # cannot :member, Post do |post|
    #   user == post.user
    # end

    # can :like, Post do |post|
    #   user != post.user
    # end

    can :destroy, Like do |like|
      user != like.post.user
    end

    can :destroy, Member do |member|
      user != member.post.user
    end
  end

end
