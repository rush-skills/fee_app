class Student < ActiveRecord::Base
  belongs_to :user
  belongs_to :institute
  has_many :fee_payments
  validates_formatting_of :email, using: :email
end
