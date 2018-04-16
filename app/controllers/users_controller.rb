class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show 
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params) 
    if @user.save
      #注册后便记录了当前用户
      log_in @user
      flash[:success] = "Welcome to the Petrochemical Corrosion App!"
      redirect_to user_url(@user)

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
