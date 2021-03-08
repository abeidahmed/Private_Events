class SessionsController < ApplicationController
  before_action :ensure_login, only: %i[new create]

  def new
    @user = User.new
  end

  def create 
    @user = User.find_by(name: params[:name])
    if @user 
      session[:user_id] = @user.id
      redirect_to events_path, notice: "Welcome #{@user.id}!"
    else
      flash.now.alert = 'Login faild'
      render :new
    end
  end

  def destroy
    session[:user_id].delete(:user_id) if logged_in?
    flash[:notice] = 'You have successfully logged out.'
    redirect_to new_user_path
  end
end
