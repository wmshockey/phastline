require 'test_helper'

class DrasControllerTest < ActionController::TestCase
  setup do
    @dra = dras(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dras)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dra" do
    assert_difference('Dra.count') do
      post :create, dra: { dra_percent: @dra.dra_percent, end_kmp: @dra.end_kmp, start_kmp: @dra.start_kmp }
    end

    assert_redirected_to dra_path(assigns(:dra))
  end

  test "should show dra" do
    get :show, id: @dra
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dra
    assert_response :success
  end

  test "should update dra" do
    patch :update, id: @dra, dra: { dra_percent: @dra.dra_percent, end_kmp: @dra.end_kmp, start_kmp: @dra.start_kmp }
    assert_redirected_to dra_path(assigns(:dra))
  end

  test "should destroy dra" do
    assert_difference('Dra.count', -1) do
      delete :destroy, id: @dra
    end

    assert_redirected_to dras_path
  end
end
