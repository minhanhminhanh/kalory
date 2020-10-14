class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def show
    #user_list = User.all
    # @users = user_list
     @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      reset_session
      log_in @user
      flash[:success] = "Welcome to the Calories Guessing!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  private
    def user_params
      params.require(:user).permit(:name, :email, :password,
      :password_confirmation)
    end

end
