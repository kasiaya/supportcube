class DoctorsController < ApplicationController
  def new
    @doctor = Doctor.new
  end

  def create
    @doctor = Doctor.new(doctor_params)
    if @doctor.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def doctor_params
    params.require(:doctor).permit(:doctor_name, :specialty_id)
  end
end
