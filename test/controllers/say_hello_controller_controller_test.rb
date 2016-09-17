require 'test_helper'

class SayHelloControllerControllerTest < ActionController::TestCase
  test "should get say" do
    get :say
    assert_response :success
  end

end
