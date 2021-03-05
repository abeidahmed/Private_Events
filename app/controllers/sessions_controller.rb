class SessionsController < ApplicationController
  def new
  end

  def create 
    user = User.find_by(params[:name])
    if user 
      session[:user_id] = user
      redirect_to root_path, notice: "Welcome #{user.id}!"
    else
      flash.now.alert = 'Login faild'
      render :new
    end
  end
end
