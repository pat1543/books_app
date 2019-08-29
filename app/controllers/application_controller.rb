# frozen_string_literal: trur

class ApplicationController < ActionController::Base
  before_action :set_locale
  add_flash_types :success, :info, :warning, :danger
  before_action :configure_permitted_parameters, if: :devise_controller?

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options(options = {})
    { locale: I18n.locale }.merge options
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :postal_code, :address, :introduction])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :postal_code, :address, :introduction])
  end
end
