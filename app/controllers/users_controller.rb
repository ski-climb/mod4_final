class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "New account for #{@user.email} successfully created"
      session[:user_id] = @user.id
      redirect_to root_path
    else
      @errors = @user.errors
      render :new
    end
  end

  private

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
