require 'test_helper'

class SayHelloControllerTest < ActionController::TestCase
  test "should get say" do
    get :say
    assert_response :success
  end

end
