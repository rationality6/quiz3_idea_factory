class SessionsController < ApplicationController

  def create
    @user = User.find_by_email params[:email]
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'Signed in!'
    else
      flash[:alert] = 'Wrong credentials'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'Logged out!'
  end
  
end
