class Admins::UsersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
       flash[:success] = "会員情報を変更しました"
       redirect_to admins_user_path(@user)
    else
      render "edit"
    end

  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :kana_first_name, :kana_last_name, :postal_code, :address, :phone_number, :email, :introduction, :background_image, :profile_image, :is_deleted, :nickname)
  end

end
