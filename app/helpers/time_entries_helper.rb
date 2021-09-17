module TimeEntriesHelper

  def display_time_entry(time_entry, format)
    time_entry.localtime.to_s(format)
  end

  def display_duration(time_entry)
    calculate_time_units(time_entry.duration)
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
    days = days.zero? ? '' : '+' << pluralize(days, 'day')
    format("%s  %s:%s:%s", days, pad(hours), pad(minutes), pad(seconds))
  end

  def pad(unit)
    unit.to_s.rjust(2, '0')
  end

end
