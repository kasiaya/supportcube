class ReferralsController < ApplicationController
  before_action :set_staff, only: [:new, :create, :destroy]
  before_action :move_to_index, only: [:edit]

  def index
    @before_referrals = Referral.includes(:staff, :partner).all.active_statuses.order(created_at: :desc)
    @after_referrals = Referral.includes(:staff, :partner).all.active_determinations.order(created_at: :desc)
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

  def destroy
    @referral = Referral.find(params[:id])
    @referral.destroy
    redirect_to root_path
  end

  def search
    @q = Referral.ransack(params[:q])
    @referrals = @q.result.includes(:staff, :partner).order(created_at: :desc)

    @staffs = Staff.all
    @partners = Partner.all
  end

  def plan
    # @referrals = Referral.all
  end

  private

  def set_staff
    @staff = current_staff
  end

  def move_to_index
    @referral = Referral.find(params[:id])
    return unless current_staff != @referral.staff

    redirect_to action: :index
  end

  def referral_params
    params.require(:referral).permit(:patient_name, :age, :gender, :history, :purpose, :adl, :insurance, :prognosis,
                                     :requested_date, :admission_date, :status, :determination, :memo, :Staff_id, :partner_id, :doctor_id)
  end
end
