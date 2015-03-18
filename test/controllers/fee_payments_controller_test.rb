require 'test_helper'

class FeePaymentsControllerTest < ActionController::TestCase
  setup do
    @fee_payment = fee_payments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fee_payments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fee_payment" do
    assert_difference('FeePayment.count') do
      post :create, fee_payment: { course_id: @fee_payment.course_id, institute_id: @fee_payment.institute_id, paid: @fee_payment.paid, student_id: @fee_payment.student_id, user_id: @fee_payment.user_id }
    end

    assert_redirected_to fee_payment_path(assigns(:fee_payment))
  end

  test "should show fee_payment" do
    get :show, id: @fee_payment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fee_payment
    assert_response :success
  end

  test "should update fee_payment" do
    patch :update, id: @fee_payment, fee_payment: { course_id: @fee_payment.course_id, institute_id: @fee_payment.institute_id, paid: @fee_payment.paid, student_id: @fee_payment.student_id, user_id: @fee_payment.user_id }
    assert_redirected_to fee_payment_path(assigns(:fee_payment))
  end

  test "should destroy fee_payment" do
    assert_difference('FeePayment.count', -1) do
      delete :destroy, id: @fee_payment
    end

    assert_redirected_to fee_payments_path
  end
end
