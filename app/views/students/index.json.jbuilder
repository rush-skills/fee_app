json.array!(@students) do |student|
  json.extract! student, :id, :user_id, :first_name, :middle_name, :last_name, :phone, :roll_no, :gender, :birthdate, :address, :mobile, :school, :email, :image, :institute_id
  json.url student_url(student, format: :json)
end
