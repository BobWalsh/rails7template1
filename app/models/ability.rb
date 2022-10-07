class Ability
  include CanCan::Ability

  def initialize(user)

    can [:update, :destroy], user: user
  end
end
