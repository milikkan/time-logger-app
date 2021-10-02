# == Schema Information
#
# Table name: time_entries
#
#  id          :bigint           not null, primary key
#  comment     :string
#  start       :datetime
#  end         :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#  category_id :integer
#
class TimeEntry < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates :start, presence: true
  validates :end, presence: true
  validate :end_time_must_be_greater_than_start_time

  def end_time_must_be_greater_than_start_time
    unless (self.start.nil? or self.end.nil?)
      if (self.start >= self.end)
        errors.add(:end, "can't be equal to or earlier than the start time.")
      end
    end
  end

  def duration
    (self.end - self.start).to_i
  end
end
