class FeePayment < ActiveRecord::Base
  belongs_to :course
  belongs_to :user
  belongs_to :student
  belongs_to :institute
end
