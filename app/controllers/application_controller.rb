class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :height, :weight, :gender, :photos])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :height, :weight, :gender, :photos])
  end
end
