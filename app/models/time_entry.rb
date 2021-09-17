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
