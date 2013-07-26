class AdminController < ApplicationController
require 'date'
  def count
    @user = User.paginate :page => params[:page], :per_page => 10
  end
  def s_count
  @user = User.paginate :page => params[:page], :per_page => 10
  if params[:start].present?
    start =  params[:start].split("/")
    @s_start = DateTime.new(start[2].to_i,start[0].to_i,start[1].to_i)
  end
  if params[:end].present?
    d_end = params[:end].split("/")
    @s_end = DateTime.new(d_end[2].to_i,d_end[0].to_i,d_end[1].to_i)
  end
    @s_s = params[:start] 
    @s_e = params[:end]
  end
end
