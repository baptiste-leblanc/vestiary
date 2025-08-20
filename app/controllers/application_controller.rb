class ApplicationController < ActionController::Base

  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :height, :weight, :gender])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :height, :weight, :gender])
  end

  # def after_sign_up_path_for(resource)
  #   user_contexts_path(user_id: resource.id)
  # end

  # def after_sign_in_path_for(resource)
  #   user_contexts_path(user_id: resource.id)
  # end
end
