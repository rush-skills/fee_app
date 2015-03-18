json.array!(@fee_payments) do |fee_payment|
  json.extract! fee_payment, :id, :course_id, :user_id, :student_id, :institute_id, :paid
  json.url fee_payment_url(fee_payment, format: :json)
end
