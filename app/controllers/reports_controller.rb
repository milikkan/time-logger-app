class ReportsController < ApplicationController
  include Redirectable
  before_action :redirect_non_admin_users

  def user_time
    if params[:user].present?
      @selected_user_id = params[:user]
      @selected_start = params[:start]
      @selected_stop = params[:stop]

      user = User.find_by(id: @selected_user_id)
      start_date = construct_date(@selected_start)
      stop_date = construct_date(@selected_stop, true)

      @time_entries = user.time_entries.all.filter do |time_entry|
        time_entry.start >= start_date && time_entry.stop <= stop_date
      end
    else
      @time_entries = []
    end
  end

  def category_time
    if params[:category].present?
      @selected_category_id = params[:category]
      @selected_start = params[:start]
      @selected_stop = params[:stop]

      category = Category.find_by(id: @selected_category_id)
      start_date = construct_date(@selected_start)
      stop_date = construct_date(@selected_stop, true)

      @time_entries = category.time_entries.all.filter do |time_entry|
        time_entry.start >= start_date && time_entry.stop <= stop_date
      end
    else
      @time_entries = []
    end
  end

  private

  def construct_date(date_str, end_of_day=false)
    date_parts = date_str.split(".")
    if end_of_day
      Time.zone.local(date_parts[2], date_parts[1], date_parts[0], 23, 59)
    else
      Time.zone.local(date_parts[2], date_parts[1], date_parts[0])
    end
  end
end