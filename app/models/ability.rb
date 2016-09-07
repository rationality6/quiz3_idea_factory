class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :manage, Post do |post|
      user == post.user
    end

    cannot :like, Post do |post|
      user == post.user
    end

    can :destroy, Like do |like|
      user == like.user
    end

  end
end
