class UsersController < ApplicationController
	include Redirectable

  before_action :redirect_non_admin_users
  
  def manage
  
  end
end