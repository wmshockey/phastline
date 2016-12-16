require 'test_helper'

class HeadpointsControllerTest < ActionController::TestCase
  setup do
    @headpoint = headpoints(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:headpoints)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create headpoint" do
    assert_difference('Headpoint.count') do
      post :create, headpoint: { flow: @headpoint.flow, head: @headpoint.head, pump_id: @headpoint.pump_id }
    end

    assert_redirected_to headpoint_path(assigns(:headpoint))
  end

  test "should show headpoint" do
    get :show, id: @headpoint
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @headpoint
    assert_response :success
  end

  test "should update headpoint" do
    patch :update, id: @headpoint, headpoint: { flow: @headpoint.flow, head: @headpoint.head, pump_id: @headpoint.pump_id }
    assert_redirected_to headpoint_path(assigns(:headpoint))
  end

  test "should destroy headpoint" do
    assert_difference('Headpoint.count', -1) do
      delete :destroy, id: @headpoint
    end

    assert_redirected_to headpoints_path
  end
end
