class StaffsController < ApplicationController
  before_action :set_staff, only: [:edit, :update]
  def edit
  end

  def update
    if current_staff.update(staff_params)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_staff
    @staff = current_staff
  end

  def staff_params
    params.require(:staff).permit(:staff_name, :staff_name_kana, :email)
  end

end
