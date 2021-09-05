module ReportsHelper

  SECONDS_IN_A_MINUTE = 60
  SECONDS_IN_AN_HOUR = 60 * SECONDS_IN_A_MINUTE

  def convert_to_hour_minute(end_time, start_time)
    return '' if end_time.nil? or start_time.nil?
    total_seconds = (end_time - start_time).to_i

    seconds_to_hour_and_minute(total_seconds)
  end

  def display_total_hours(time_entries)
    seconds = time_entries.map do |time_entry|
      (time_entry.end - time_entry.start).to_i
    end.inject(:+)

    seconds_to_hour_and_minute(seconds)
  end

  def display_date_value(selected_date)
    selected_date.nil? ? display_today : selected_date
  end

  def display_user_for(time_entry)
    User.find_by(id: time_entry.user_id).email
  end

  private

	def display_today
    Time.now.strftime "%d.%m.%Y"
	end

  def seconds_to_hour_and_minute(seconds)
    num_hours, remaining_seconds = seconds.divmod(SECONDS_IN_AN_HOUR)
    num_minutes, _ = remaining_seconds.divmod(SECONDS_IN_A_MINUTE)
    
    "#{pad(num_hours)}:#{pad(num_minutes)}"
  end
end