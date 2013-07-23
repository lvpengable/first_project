require 'test_helper'

class AdminControllerTest < ActionController::TestCase
  test "should get count" do
    get :count
    assert_response :success
  end

end
