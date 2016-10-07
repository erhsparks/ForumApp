class UsersController < ApplicationController
  def new
    @user = User.new

    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login!(@user)

      redirect_to user_url(@user)
    else
      flash.now[:errors] = @user.errors.full_messages

      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
    render :edit
  end

  def update
    @user = User.find_by_credentials(user_params)
    if @user.is_a?(User)
      @user.update(user_params)
      redirect_to user_url(@user)
    else
      flash[:errors] = @user
      render :edit
    end
  end

  def show
    @user = User.find(params[:id])

    render :show
  end

  def destroy
    @user = User.find_by_credentials(user_params)
    if @user.is_a?(User)
      @user.destroy
    else
      flash[:errors] = @user

      render :show
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
