class AdminController < ApplicationController
require 'date'
  def count
    @count = User.count
    sql = 'select count(*) c from users where is_arrive=1'
    @count_arrive = ActiveRecord::Base.connection.execute(sql)
    @user = User.paginate :page => params[:page], :per_page => 2
  end
  def s_count
  if params[:start].present?
    start =  params[:start].split("/")
    s_start = DateTime.new(start[2].to_i,start[0].to_i,start[1].to_i)
  end
  if params[:end].present?
    d_end = params[:end].split("/")
    s_end = DateTime.new(d_end[2].to_i,d_end[0].to_i,d_end[1].to_i)
  end
    @count = User.count 
    sql = 'select count(*) c from users where is_arrive=1'
    @count_arrive = ActiveRecord::Base.connection.execute(sql)
    if params[:start].present? && params[:end].present?
    @user = User.where(["checkin_time between ? and ?",s_start,s_end]).paginate :page => params[:page], :per_page => 2 
    elsif params[:start].present?
    @user = User.where(["checkin_time >= ?",s_start]).paginate :page => params[:page], :per_page => 2
    elsif params[:end].present?
    @user = User.where(["checkin_time <= ?",s_end]).paginate :page => params[:page], :per_page => 2
    else 
    @user =User.paginate :page => params[:page],:per_page => 2
    end
    @s_s = params[:start] 
    @s_e = params[:end]
    render :action => 'count'
  end
end
