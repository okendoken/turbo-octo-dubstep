class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    can :manage, Thing, :user_id => user.id
    can :finish, Want do |want|
      want.user != user
    end
  end
end
