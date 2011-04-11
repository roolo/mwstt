require 'test_helper'

class AjaxControllerTest < ActionController::TestCase
  test "should get activities_contains" do
    get :activities_contains
    assert_response :success
  end

end
