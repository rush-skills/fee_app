# == Schema Information
#
# Table name: institutes
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Institute < ActiveRecord::Base
  has_many :students
  has_many :fee_payments
end
