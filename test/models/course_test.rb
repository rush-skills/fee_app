# == Schema Information
#
# Table name: courses
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  name       :string(255)
#  fee        :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
