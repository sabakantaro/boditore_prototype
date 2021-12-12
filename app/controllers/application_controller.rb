# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    if resource_class == User
      devise_parameter_sanitizer.permit(:sign_up, keys: %i[name email profile experience])
      devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
      devise_parameter_sanitizer.permit(:account_update, keys: %i[name email profile experience image])
    end
  end
end
