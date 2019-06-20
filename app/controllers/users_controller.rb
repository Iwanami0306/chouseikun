# coding: utf-8
class UsersController < ApplicationController
  
  def new
    @user = User.new
  end
  def show
    @user = User.find(params[:id])
    @events = @user.events.paginate(page: params[:page])
  end
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "ユーザ登録完了"
      redirect_to @user
    else
      render 'new'
    end
  end

   def index
     @users = User.paginate(page: params[:page])
   end
  private
   def user_params
    params.require(:user).permit(:name, :email, :password,:password_confirmation)
   end

   # 正しいユーザーかどうかを確認
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    # 管理者かどうかを確認
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
