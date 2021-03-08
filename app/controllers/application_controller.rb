class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception 

  # before_action :ensure_login 

    def ensure_login
      redirect_to sessions_path unless session[:user_id]
    end

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def logged_in?
      current_user
    end

    def event_params 
      params.require(:event).permit(:date, :details)
    end

    def user_params
      params.require(:user).permit(:name)
    end
end
