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

class FeePayment < ActiveRecord::Base
  belongs_to :course
  belongs_to :student
  belongs_to :institute
end
