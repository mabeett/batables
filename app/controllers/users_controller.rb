class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @user = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user, :notice => 'The user was successfully created.'
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.save
      redirect_to @user, notice: 'The user was successfully updated.'
    else
      render 'edit'
    end
  end

  def show
  end

  def destroy
    @user.destroy
    redirect_to users_url
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end