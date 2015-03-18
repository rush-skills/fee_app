class Institute < ActiveRecord::Base
  belongs_to :user
  has_many :students
  has_many :fee_payments
end
