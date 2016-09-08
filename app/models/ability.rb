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

    can :like, Post do |post|
      user != post.user
    end

    can :like, Post do |post|
      user != post.user
    end

    can :destroy, Like do |like|
      user == like.user
    end
  end

end
