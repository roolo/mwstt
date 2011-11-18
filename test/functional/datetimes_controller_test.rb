require 'test_helper'

class DatetimesControllerTest < ActionController::TestCase
  setup do
    @datetime = datetimes(:one)
  end

  
  # Login Redirections
  
  test "without login should get redirection on index" do
    get :index
    assert_response :found
  end
  
  test "without login should get redirection on create" do
    post :create, :datetime => @datetime.attributes
    
    assert_redirected_to login_path
  end
  
  test "without login should get redirection on new" do
    get :new
    assert_redirected_to login_path
  end
  
  test "without login should get redirection on destroy" do
    delete :destroy, :id => @datetime.to_param
    
    assert_redirected_to login_path
  end
    
  test "without login should get redirection on edit" do
    get :edit, :id => @datetime.to_param
    assert_redirected_to login_path
  end
  
  test "without login should get redirection on show" do
    get :show, :id => @datetime.to_param
    assert_redirected_to login_path
  end
  
  test "without login should get redirection on update" do
    put :update, :id => @datetime.to_param, :datetime => @datetime.attributes
    assert_redirected_to login_path
  end
  
  
  # Normal operations
  
  
  test "should get index" do
    login_test_user
    
    get :index
    assert_response :success
    assert_not_nil assigns(:datetimes)
  end

  test "should get new" do
    login_test_user
  
    get :new
    assert_response :success
  end

  test "should create datetime" do
    login_test_user
  
    assert_difference('Datetime.count') do
      post :create, :datetime => @datetime.attributes
    end

    assert_redirected_to datetime_path(assigns(:datetime))
  end

  test "should show datetime" do
    login_test_user
  
    get :show, :id => @datetime.to_param
    assert_response :success
  end

  test "should get edit" do
    login_test_user
  
    get :edit, :id => @datetime.to_param
    assert_response :success
  end

  test "should update datetime" do
    login_test_user
  
    put :update, :id => @datetime.to_param, :datetime => @datetime.attributes
    assert_redirected_to datetime_path(assigns(:datetime))
  end

  test "should destroy datetime" do
    login_test_user
  
    assert_difference('Datetime.count', -1) do
      delete :destroy, :id => @datetime.to_param
    end

    assert_redirected_to datetimes_path
  end
end
