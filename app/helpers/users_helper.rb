module UsersHelper
  def user_link(user)
    link_to user.username, user
  end
end
