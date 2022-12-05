class Doctors::BaseController < ApplicationController
  before_action :ensure_current_user_is_doctor

  private

  def ensure_current_user_is_doctor
    authorize! :act_like_doctor, Doctors::BaseController, current_user
  end
end
