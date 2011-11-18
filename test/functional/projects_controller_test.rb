require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase
  setup do
    @project = projects(:one)
  end
  
  # Login Redirections
  
  test "without login should get redirection on index" do
    get :index
    assert_response :found
  end
  
  test "without login should get redirection on create" do
    post :create, :project => @project.attributes
    
    assert_redirected_to login_path
  end
  
  test "without login should get redirection on new" do
    get :new
    assert_redirected_to login_path
  end
  
  test "without login should get redirection on destroy" do
    delete :destroy, :id => @project.to_param
    
    assert_redirected_to login_path
  end
    
  test "without login should get redirection on edit" do
    get :edit, :id => @project.to_param
    assert_redirected_to login_path
  end
  
  test "without login should get redirection on show" do
    get :show, :id => @project.to_param
    assert_redirected_to login_path
  end
  
  test "without login should get redirection on update" do
    put :update, :id => @project.to_param, :project => @project.attributes
    assert_redirected_to login_path
  end
  
  
  # Normal operations
  
  
  test "should get index with login" do
    login_test_user
    
    get :index
    assert_response :success
    assert_not_nil assigns(:projects)
  end

  test "should get new" do
    login_test_user
    
    get :new
    assert_response :success
  end

  test "should create project" do
    login_test_user
  
    assert_difference('Project.count') do
      post :create, :project => @project.attributes
    end

    assert_redirected_to project_path(assigns(:project))
  end

  test "should show project" do
    login_test_user
  
    get :show, :id => @project.to_param
    assert_response :success
  end

  test "should get edit" do
    login_test_user
  
    get :edit, :id => @project.to_param
    assert_response :success
  end

  test "should update project" do
    login_test_user
  
    put :update, :id => @project.to_param, :project => @project.attributes
    assert_redirected_to project_path(assigns(:project))
  end

  test "should destroy project" do
    login_test_user
    
    assert_difference('Project.count', -1) do
      delete :destroy, :id => @project.to_param
    end

    assert_redirected_to projects_path
  end
end
