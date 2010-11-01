require 'test_helper'

class DatetimesControllerTest < ActionController::TestCase
  setup do
    @datetime = datetimes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:datetimes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create datetime" do
    assert_difference('Datetime.count') do
      post :create, :datetime => @datetime.attributes
    end

    assert_redirected_to datetime_path(assigns(:datetime))
  end

  test "should show datetime" do
    get :show, :id => @datetime.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @datetime.to_param
    assert_response :success
  end

  test "should update datetime" do
    put :update, :id => @datetime.to_param, :datetime => @datetime.attributes
    assert_redirected_to datetime_path(assigns(:datetime))
  end

  test "should destroy datetime" do
    assert_difference('Datetime.count', -1) do
      delete :destroy, :id => @datetime.to_param
    end

    assert_redirected_to datetimes_path
  end
end
