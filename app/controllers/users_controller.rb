class UsersController < ApplicationController
  def login
    return unless request.post?
    login = User.authenticate(params[:username],params[:password])
    if login
      flash[:notice] = "login successfully"
      @user = User.find_by_name(params[:username])
      session[:user] = @user.id
      redirect_to :action => 'index',:id => @user
    else
      flash[:notice] = "wrong username or password"
    end    
  end
  
  def index
    if params[:id].present?
    @user = User.find_by_id(params[:id]) 
    end
  end

  def mypage
  end
  
  def checkin
    @user = User.find_by_id(session[:user])
    @user.is_arrive = 1
    @user.save   
    respond_to do |format|
     format.html { redirect_to :action => 'index' }
     format.js
    end
  end
end
