module TimeEntriesHelper

	def display_time_entry(dt, format)
		return '' if dt.nil?
    dt.localtime.to_s(format)
	end

	def show_duration_between(end_time, start_time)
		return '' if end_time.nil? or start_time.nil?
    total_seconds = (end_time - start_time).to_i
    format_duration(calculate_time_units(total_seconds))
	end

  def display_comment(time_entry)
    return 'none' if time_entry.comment.empty?
    output = h truncate(time_entry.comment, length: 30)
    output += link_to('[more]', time_entry_path(time_entry)) if time_entry.comment.size > 30
    output.html_safe
  end

	private

  def calculate_time_units(total_seconds)
    days, remaining = total_seconds.divmod(24 * 60 * 60)
    hours, remaining = remaining.divmod(60 * 60)
    minutes, seconds = remaining.divmod(60)
    return days, hours, minutes, seconds
  end

  def format_duration(units)
    days, hours, minutes, seconds = units
    days = days.zero? ? '' : '+' << pluralize(days, 'day')
    "#{days} #{hours.to_s.rjust(2, '0')}:#{minutes.to_s.rjust(2, '0')}:#{seconds.to_s.rjust(2, '0')}"
  end

end
