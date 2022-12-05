# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery

  before_action :authenticate_user!

  protected

  def after_sign_in_path_for(_)
    return admin_root_path if current_user.admin?
    return doctors_appointments_path if current_user.doctor?

    root_path
  end

  def admin_panel_access_denied(_)
    redirect_to root_path
  end
end
