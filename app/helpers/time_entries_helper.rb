module TimeEntriesHelper

	SECONDS_IN_A_MINUTE = 60
	SECONDS_IN_AN_HOUR = 60 * SECONDS_IN_A_MINUTE
	SECONDS_IN_A_DAY = 24 * SECONDS_IN_AN_HOUR

	def display_time_entry(dt)
		return '' if dt.nil?
    dt.localtime.to_s(:short)
	end

	def convert_to_day_hour_minute(end_time, start_time)
		return '' if end_time.nil? or start_time.nil?
    total_seconds = (end_time - start_time).to_i

    num_days, remaining_seconds = total_seconds.divmod(SECONDS_IN_A_DAY)
    num_hours, remaining_seconds = remaining_seconds.divmod(SECONDS_IN_AN_HOUR)
    num_minutes, remaining_seconds = remaining_seconds.divmod(SECONDS_IN_A_MINUTE)

    result = ''
    result << print_number_of_days(num_days) unless num_days < 1
    "#{result} #{pad(num_hours)}:#{pad(num_minutes)}"
	end

	private

	def pad(num)
    num > 9 ? num.to_s : "0" + num.to_s
	end

	def print_number_of_days(days)
    suffix = days > 1 ? "days" : "day"
    "#{days} #{suffix}"
	end
end
