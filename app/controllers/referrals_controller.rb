class ReferralsController < ApplicationController
  before_action :set_staff, only: [:new, :create]

  def index
    @referrals = Referral.includes(:staff, :partner).all.active
  end

  def new
    @referral = Referral.new
  end

  def create
    @referral = Referral.new(referral_params)
    @referral.staff = @staff
    if @referral.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @referral = Referral.includes(:doctor, :partner).find(params[:id])
  end

  def edit
    @referral = Referral.includes(:doctor, :partner).find(params[:id])
  end

  def update
    @referral = Referral.find(params[:id])
    if @referral.update(referral_params)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_staff
    @staff = current_staff
  end

  def referral_params
    params.require(:referral).permit(:patient_name, :age, :gender, :history, :purpose, :adl, :insurance, :prognosis, :requested_date, :admission_date, :status, :determination, :memo, :Staff_id, :partner_id, :doctor_id)
  end
  
end
