module Redirectable
  def redirect_not_loggedin_users
    redirect_to root_path unless is_logged_in?
  end

  def redirect_non_admin_users
    redirect_to root_path unless is_logged_in? && is_admin?
  end

  private

  def is_logged_in?
    Current.user.present?
  end

  def is_admin?
    Current.user.is_admin
  end
end