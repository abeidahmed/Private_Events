class ApplicationController < ActionController::Base

  # before_action :ensure_login 

    def ensure_login
      redirect_to sessions_path unless session[:user_id]
    end

    def current_user
      @current_user ||= User.find(sessions[:user_id]) if session[:user_id]
    end

    def event_params 
      params.require(:event).permit(:date)
    end

    def user_params
      params.require(:user).permit(:name)
    end
end
