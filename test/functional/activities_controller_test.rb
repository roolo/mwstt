require 'test_helper'

class ActivitiesControllerTest < ActionController::TestCase
  setup do
    @activity = activities(:one)
  end
  
  # Login Redirections
  
  test "without login should get redirection on index" do
    get :index
    assert_response :found
  end
  
  test "without login should get redirection on create" do
    post :create, :activity => @activity.attributes
    
    assert_redirected_to login_path
  end
  
  test "without login should get redirection on new" do
    get :new
    assert_redirected_to login_path
  end
  
  test "without login should get redirection on destroy" do
    delete :destroy, :id => @activity.to_param
    
    assert_redirected_to login_path
  end
    
  test "without login should get redirection on edit" do
    get :edit, :id => @activity.to_param
    assert_redirected_to login_path
  end
  
  test "without login should get redirection on show" do
    get :show, :id => @activity.to_param
    assert_redirected_to login_path
  end
  
  test "without login should get redirection on update" do
    put :update, :id => @activity.to_param, :activity => @activity.attributes
    assert_redirected_to login_path
  end
  
  
  
  # Normal Operations
  
  test "should get index with login" do
    login_test_user
  
    get :index
    assert_response :success
    assert_not_nil assigns(:activities)
  end

  test "should get new" do
    login_test_user
    
    get :new
    assert_response :success
  end

  test "should create activity" do
    login_test_user
  
    assert_difference('Activity.count') do
      post :create, :activity => @activity.attributes
    end

    assert_redirected_to activity_path(assigns(:activity))
  end

  test "should show activity" do
    login_test_user
    
    get :show, :id => @activity.to_param
    assert_response :success
  end

  test "should get edit" do
    login_test_user
    
    get :edit, :id => @activity.to_param
    assert_response :success
  end

  test "should update activity" do
    login_test_user
    
    put :update, :id => @activity.to_param, :activity => @activity.attributes
    assert_redirected_to activity_path(assigns(:activity))
  end

  test "should destroy activity" do
    login_test_user
    
    assert_difference('Activity.count', -1) do
      delete :destroy, :id => @activity.to_param
    end

    assert_redirected_to activities_path
  end
end
