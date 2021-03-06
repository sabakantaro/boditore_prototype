class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :current_user

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:post_attributes => [:user_id, :name, :content]])
    devise_parameter_sanitizer.permit(:account_update, keys: [:post_attributes => [:user_id, :name, :content]])
  end

  # def current_user
  #   return unless session[:user_id]
  #   @current_user ||= User.find(session[:user_id])
  # end

end
