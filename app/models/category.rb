class Category < ApplicationRecord
  has_many :time_entries

  validates :name, presence: true
  validates :name, uniqueness: {message: ' exists. Choose a different category name.'}
end
