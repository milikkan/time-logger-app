module Redirectable
  def redirect_not_loggedin_users
    redirect_to root_path unless Current.user.present?
  end

  def redirect_not_admin_users

  end

  def is_admin?
  	Current.user.is_admin
  end
end