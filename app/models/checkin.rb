class Checkin < ActiveRecord::Base
  attr_accessible :checkin_time, :user_id
  belongs_to :user
end
