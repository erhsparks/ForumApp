class SubsController < ApplicationController
  before_action :require_login!

  def new
    @sub = Sub.new
    render :new
  end

  def create
    @sub = Sub.new(sub_params)
    @sub.moderator_id = current_user.id
    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :new
    end
  end

  def edit
    @sub = Sub.find(params[:id])
    render :edit
  end

  def update
    @sub = Sub.find(params[:id])
    if @sub.update(sub_params)
      redirect_to sub_url(@sub)
    else
      flash[:errors] = @sub.errors.full_messages
      render :edit
    end
  end

  def show
    @sub = Sub.find(params[:id])
    render :show
  end

  def destroy
    @sub = Sub.find(params[:id])
    if @sub
      @sub.destroy
      redirect_to subs_url
    else
      flash[:errors] = @sub.errors.full_messages
      render :show
    end
  end

  def index
    @subs = Sub.all
    render :index
  end

  private

  def sub_params
    params.require(:s).permit(:title, :description, :moderator_id)
  end
end
