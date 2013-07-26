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
    if session[:user].present?
    @user = User.find_by_id(session[:user]) 
    end
  end

  def mypage
  end
  
  def checkin
    time_now = Time.now
    @user = User.find_by_id(session[:user])
    @checkin = @user.checkins.last
    if @checkin.present?
    last_time = @checkin.checkin_time
    if last_time.year >= time_now.year && last_time.month >= time_now.month && last_time.day > time_now.day
     @checkin = Checkin.new
     @checkin.user_id = session[:user]
     @checkin.checkin_time = Time.now
     @checkin.save
    else
     @notice = last_time
    end
    else
     @checkin = Checkin.new
     @checkin.user_id = session[:user]
     @checkin.checkin_time = Time.now
     @checkin.save
    end
    render :text => @notice

  end
end
