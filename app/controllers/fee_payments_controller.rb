class FeePaymentsController < ApplicationController

  #->Prelang (scaffolding:rails/scope_to_user)
  before_filter :require_user_signed_in, only: [:new, :edit, :create, :update, :destroy]

  before_action :set_fee_payment, only: [:show, :edit, :update, :destroy]

  # GET /fee_payments
  # GET /fee_payments.json
  def index
    @fee_payments = FeePayment.all
  end

  # GET /fee_payments/1
  # GET /fee_payments/1.json
  def show
  end

  # GET /fee_payments/new
  def new
    @fee_payment = FeePayment.new
  end

  # GET /fee_payments/1/edit
  def edit
  end

  # POST /fee_payments
  # POST /fee_payments.json
  def create
    @fee_payment = FeePayment.new(fee_payment_params)
    @fee_payment.user = current_user

    respond_to do |format|
      if @fee_payment.save
        format.html { redirect_to @fee_payment, notice: 'Fee payment was successfully created.' }
        format.json { render :show, status: :created, location: @fee_payment }
      else
        format.html { render :new }
        format.json { render json: @fee_payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fee_payments/1
  # PATCH/PUT /fee_payments/1.json
  def update
    respond_to do |format|
      if @fee_payment.update(fee_payment_params)
        format.html { redirect_to @fee_payment, notice: 'Fee payment was successfully updated.' }
        format.json { render :show, status: :ok, location: @fee_payment }
      else
        format.html { render :edit }
        format.json { render json: @fee_payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fee_payments/1
  # DELETE /fee_payments/1.json
  def destroy
    @fee_payment.destroy
    respond_to do |format|
      format.html { redirect_to fee_payments_url, notice: 'Fee payment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fee_payment
      @fee_payment = FeePayment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fee_payment_params
      params.require(:fee_payment).permit(:course_id, :user_id, :student_id, :institute_id, :paid)
    end
end
