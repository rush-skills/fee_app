require 'test_helper'

class StudentsControllerTest < ActionController::TestCase
  setup do
    @student = students(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:students)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create student" do
    assert_difference('Student.count') do
      post :create, student: { address: @student.address, birthdate: @student.birthdate, email: @student.email, first_name: @student.first_name, gender: @student.gender, image: @student.image, institute_id: @student.institute_id, last_name: @student.last_name, middle_name: @student.middle_name, mobile: @student.mobile, phone: @student.phone, roll_no: @student.roll_no, school: @student.school, user_id: @student.user_id }
    end

    assert_redirected_to student_path(assigns(:student))
  end

  test "should show student" do
    get :show, id: @student
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @student
    assert_response :success
  end

  test "should update student" do
    patch :update, id: @student, student: { address: @student.address, birthdate: @student.birthdate, email: @student.email, first_name: @student.first_name, gender: @student.gender, image: @student.image, institute_id: @student.institute_id, last_name: @student.last_name, middle_name: @student.middle_name, mobile: @student.mobile, phone: @student.phone, roll_no: @student.roll_no, school: @student.school, user_id: @student.user_id }
    assert_redirected_to student_path(assigns(:student))
  end

  test "should destroy student" do
    assert_difference('Student.count', -1) do
      delete :destroy, id: @student
    end

    assert_redirected_to students_path
  end
end
