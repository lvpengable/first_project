class AdminController < ApplicationController
  def count
    @count = User.count
    sql = 'select count(*) count from users where is_arrive=1'
    @count_arrive = ActiveRecord::Base.connection.execute(sql)
  end
end
