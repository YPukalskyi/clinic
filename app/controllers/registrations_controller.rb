class RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(
        :first_name, :last_name, :email,
        :phone_number, :password
      )
    end

    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(
        :avatar, :first_name, :last_name, :email,
        :phone_number, :password, :current_password
      )
    end
  end
end
