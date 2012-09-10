require 'test_helper'

class AppusersControllerTest < ActionController::TestCase
  setup do
    @appuser = appusers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:appusers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create appuser" do
    assert_difference('Appuser.count') do
      post :create, appuser: {  }
    end

    assert_redirected_to appuser_path(assigns(:appuser))
  end

  test "should show appuser" do
    get :show, id: @appuser
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @appuser
    assert_response :success
  end

  test "should update appuser" do
    put :update, id: @appuser, appuser: {  }
    assert_redirected_to appuser_path(assigns(:appuser))
  end

  test "should destroy appuser" do
    assert_difference('Appuser.count', -1) do
      delete :destroy, id: @appuser
    end

    assert_redirected_to appusers_path
  end
end
