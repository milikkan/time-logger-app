# == Schema Information
#
# Table name: categories
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Category < ApplicationRecord
  has_many :time_entries

  validates :name, presence: true
  validates :name, uniqueness: {message: ' exists. Choose a different category name.'}
end
