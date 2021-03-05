class SessionsController < ApplicationController
  skip_before_action :ensure_login, only: %i[new create]

  def new
    @user = User.new
  end

  def create 
    @user = User.find_by(name: params[:name])
    if @user 
      session[:user_id] = user.id
      redirect_to user_path, notice: "Welcome #{user.id}!"
    else
      flash.now.alert = 'Login faild'
      render :new
    end
  end

  def destroy
    reset_session # Wipe out session and everthing in it
    redirect_to sessions_path
  end
end
