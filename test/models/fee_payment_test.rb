# == Schema Information
#
# Table name: fee_payments
#
#  id           :integer          not null, primary key
#  course_id    :integer
#  user_id      :integer
#  student_id   :integer
#  institute_id :integer
#  paid         :integer
#  created_at   :datetime
#  updated_at   :datetime
#

require 'test_helper'

class FeePaymentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
