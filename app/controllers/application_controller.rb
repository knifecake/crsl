class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_locale

  protected
    def set_locale
      I18n.locale = params[:l] || I18n.default_locale
    end

    def default_url_options
      { l: I18n.locale }
    end
end
