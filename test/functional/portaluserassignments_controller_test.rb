require 'test_helper'

class PortaluserassignmentsControllerTest < ActionController::TestCase
  setup do
    @portaluserassignment = portaluserassignments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:portaluserassignments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create portaluserassignment" do
    assert_difference('Portaluserassignment.count') do
      post :create, portaluserassignment: {  }
    end

    assert_redirected_to portaluserassignment_path(assigns(:portaluserassignment))
  end

  test "should show portaluserassignment" do
    get :show, id: @portaluserassignment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @portaluserassignment
    assert_response :success
  end

  test "should update portaluserassignment" do
    put :update, id: @portaluserassignment, portaluserassignment: {  }
    assert_redirected_to portaluserassignment_path(assigns(:portaluserassignment))
  end

  test "should destroy portaluserassignment" do
    assert_difference('Portaluserassignment.count', -1) do
      delete :destroy, id: @portaluserassignment
    end

    assert_redirected_to portaluserassignments_path
  end
end
