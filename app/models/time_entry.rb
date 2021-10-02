# == Schema Information
#
# Table name: time_entries
#
#  id          :bigint           not null, primary key
#  comment     :string
#  start       :datetime
#  stop        :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#  category_id :integer
#
class TimeEntry < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates :start, presence: true
  validates :stop, presence: true
  validate :stop_time_must_be_greater_than_start_time

  def stop_time_must_be_greater_than_start_time
    unless (start.nil? or stop.nil?)
      if (start >= stop)
        errors.add(:stop, "time can't be equal to or earlier than the start time.")
      end
    end
  end

  def duration
    (stop - start).to_i
  end
end
