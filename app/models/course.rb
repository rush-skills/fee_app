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

class Course < ActiveRecord::Base
  has_many :fee_payments
end
