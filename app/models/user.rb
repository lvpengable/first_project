class User < ActiveRecord::Base
  # attr_accessible :title, :body
  def self.authenticate(user_name,password)
    @user =  User.find_by_name(user_name)    
    if @user.present?
      if  @user.password == password
	return true
      end
    end
    return false
  end

end
