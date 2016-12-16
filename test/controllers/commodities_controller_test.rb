require 'test_helper'

class CommoditiesControllerTest < ActionController::TestCase
  setup do
    @commodity = commodities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:commodities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create commodity" do
    assert_difference('Commodity.count') do
      post :create, commodity: { commodity_id: @commodity.commodity_id, commodity_name: @commodity.commodity_name, density: @commodity.density, density_cf: @commodity.density_cf, temp1: @commodity.temp1, temp2: @commodity.temp2, vapor: @commodity.vapor, visc1: @commodity.visc1, visc2: @commodity.visc2 }
    end

    assert_redirected_to commodity_path(assigns(:commodity))
  end

  test "should show commodity" do
    get :show, id: @commodity
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @commodity
    assert_response :success
  end

  test "should update commodity" do
    patch :update, id: @commodity, commodity: { commodity_id: @commodity.commodity_id, commodity_name: @commodity.commodity_name, density: @commodity.density, density_cf: @commodity.density_cf, temp1: @commodity.temp1, temp2: @commodity.temp2, vapor: @commodity.vapor, visc1: @commodity.visc1, visc2: @commodity.visc2 }
    assert_redirected_to commodity_path(assigns(:commodity))
  end

  test "should destroy commodity" do
    assert_difference('Commodity.count', -1) do
      delete :destroy, id: @commodity
    end

    assert_redirected_to commodities_path
  end
end
