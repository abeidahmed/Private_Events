class ApplicationController < ActionController::Base
  add_flash_types :error, :success

  before_action :ensure_login 

  protected

    def ensure_login
      redirect_to sessions_path unless session[:user_id]
    end
end
