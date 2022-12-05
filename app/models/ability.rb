class Ability
  include CanCan::Ability

  def initialize(user)
    return if user.blank?

    if user.doctor?
      can :act_like_doctor, Doctors::BaseController
    end

    if user.admin?
      can :act_like_admin, ActiveAdmin::Page, name: 'Dashboard', namespace: 'admin'
    end
  end
end
