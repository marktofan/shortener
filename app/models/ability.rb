class Ability
  include CanCan::Ability


  def initialize(user)

    alias_action :show, :to => :redirect

    @user = user || User.new # guest user (not logged in)

    @user.roles_keys.each do |role|
      send(role)
    end
  end

  def admin
    can :manage, :all
  end

  def usr
    can [:read, :create, :destroy], Link, :user_id => @user.id
    can [:redirect], Link
  end

  def guest
    can [:create, :redirect], Link
  end
end
