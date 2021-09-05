class TimeEntry < ApplicationRecord
	belongs_to :user
	belongs_to :category

	validates :start, presence: true
	validates :end, presence: true
end
