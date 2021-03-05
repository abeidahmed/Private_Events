class UsersController < ApplicationController
  skip_before_action :ensure_login, only: %i[new create]

  def new
    @user = User.new
  end

  def create
    @user = User.new

    # if @user.save 
    #   redirect_to user_path
    # else
    #   render :new
    # end
  end

  def show
    @user = find_by(params[:name])
  end
end
