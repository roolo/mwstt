require 'test_helper'

class AccountControllerTest < ActionController::TestCase
  test "should get redirection without login" do
    get :index
    assert_redirected_to login_path
  end

  test "should get index after login" do
    login_test_user

    get :index
    assert :success
  end

  test "should get edit after login" do
    login_test_user

    get :edit
    assert :success
  end

end
