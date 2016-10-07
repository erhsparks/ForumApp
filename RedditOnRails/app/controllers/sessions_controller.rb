class SessionsController < ApplicationController
  def new
    @user = User.new

    render :new
  end

  def create
    @user = User.find_by_credentials(user_params)

    if @user.is_a?(User)
      login!(@user)

      redirect_to user_url(@user)
    else
      flash.now[:errors] = @user

      render :new
    end
  end

  def destroy
    logout!

    redirect_to new_session_url
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
