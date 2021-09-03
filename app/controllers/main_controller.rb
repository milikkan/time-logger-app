class MainController < ApplicationController

  def index
    redirect_to time_entries_path if Current.user.present?
  end 

end