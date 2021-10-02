module ReportsHelper

  def display_total_hours(time_entries)
    seconds = time_entries.map do |time_entry|
      (time_entry.stop - time_entry.start).to_i
    end.inject(:+)

    seconds_to_hour_and_minute(seconds)
  end

  def display_date_value(date)
    date.nil? ? display_today : date
  end

  private

  def display_today
    Time.now.strftime "%d.%m.%Y"
  end

  def seconds_to_hour_and_minute(seconds)
    hours, remaining_seconds = seconds.divmod(60 * 60)
    minutes, _ = remaining_seconds.divmod(60)
    
    "#{hours.to_s.rjust(2, '0')}:#{minutes.to_s.rjust(2, '0')}"
  end
end