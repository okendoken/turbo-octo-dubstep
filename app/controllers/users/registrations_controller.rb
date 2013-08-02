class Users::RegistrationsController < Devise::RegistrationsController

  def devise_parameter_sanitizer
    zuper = super
    def zuper.sign_up
      default_params.permit(*(auth_keys + [:username, :password, :password_confirmation]))
    end
    zuper
  end
end