class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      #这两个方法在helper/session_helper当中
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)

      redirect_to root_url
      
    else
      flash.now[:danger] = 'Invalid email/password combination' 
      render 'new'
    end
  end

  def destroy
    #删除当前用户的记录
    log_out if logged_in?
    #返回到主路径
    redirect_to root_url
  end
    
end
