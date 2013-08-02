class Users::PasswordsController < Devise::PasswordsController
  def resource_params
    p 'P bla bla '
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
  private :resource_params
end