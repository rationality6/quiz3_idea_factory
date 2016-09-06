class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    
    can :manage, Message do |message|
      message.user == user
    end

  end
end
