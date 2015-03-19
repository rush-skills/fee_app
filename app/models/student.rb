# == Schema Information
#
# Table name: students
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  first_name   :string(255)
#  middle_name  :string(255)
#  last_name    :string(255)
#  phone        :string(255)
#  roll_no      :string(255)
#  gender       :string(255)
#  birthdate    :date
#  address      :text
#  mobile       :text
#  school       :string(255)
#  email        :string(255)
#  image        :string(255)
#  institute_id :integer
#  created_at   :datetime
#  updated_at   :datetime
#

class Student < ActiveRecord::Base
  belongs_to :institute
  has_many :fee_payments
  validates_formatting_of :email, using: :email
end
