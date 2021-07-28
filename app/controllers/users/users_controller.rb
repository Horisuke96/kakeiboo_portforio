class Users::UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
    @posts = Post.where(user_id: current_user)
  end

  def quit
  end

  def out
    @user = current_user
    @user.update(is_deleted: true)
  reset_session
    flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
    redirect_to root_path
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      flash[:success] = "登録情報を変更しました"
      redirect_to user_path
    else
      render :edit and return
    end
  end


  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :kana_first_name, :kana_last_name, :postal_code, :address, :phone_number, :email, :introduction, :background_image, :profile_image, :is_deleted, :nickname)
  end

end
