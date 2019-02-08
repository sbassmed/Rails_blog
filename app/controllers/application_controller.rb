class ApplicationController < ActionController::Base
  def set_locale
   locale = params[:locale].to_s.strip.to_sym
   I18n.locale = I18n.available_locales.include?(locale) ?
       locale :
       I18n.default_locale
  end
end
