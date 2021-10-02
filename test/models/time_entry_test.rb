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
require "test_helper"

class TimeEntryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
