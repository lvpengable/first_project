class UsersController < ApplicationController
  def login
    return unless request.post?
    login = User.authenticate(params[:username],params[:password])
    if login
      flash[:notice] = "login successfully"
      @user = User.find_by_name(params[:username])
      redirect_to :action => 'index',@user => @user
    else
      flash[:notice] = "wrong username or password"
    end    
  end
  
  def index
    
  end

  def mypage
  end
end
