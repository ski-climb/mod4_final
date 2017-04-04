class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      flash[:success] = "Successfully signed in"
      session[:user_id] = @user.id
      redirect_to user_links_path(@user)
    else
      flash.now[:danger] = "Email and password combination is not valid"
      render :new
    end
  end
end
