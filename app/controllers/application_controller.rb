class ApplicationController < ActionController::Base
  before_action :authenticate_staff! # ログインしていないユーザーをログインページの画面に促す
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: [:employee_id, :department, :staff_name, :staff_name_kana, :email, :password,
                                             :password_confirmation])
  end
end
