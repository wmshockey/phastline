require 'test_helper'

class PumpsControllerTest < ActionController::TestCase
  setup do
    @pump = pumps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pumps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pump" do
    assert_difference('Pump.count') do
      post :create, pump: { description_text: @pump.description_text, flow_units: @pump.flow_units, head_units: @pump.head_units, impeller_diameter: @pump.impeller_diameter, minimum_suction: @pump.minimum_suction, pressure_units: @pump.pressure_units, pump_id: @pump.pump_id, stages: @pump.stages }
    end

    assert_redirected_to pump_path(assigns(:pump))
  end

  test "should show pump" do
    get :show, id: @pump
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pump
    assert_response :success
  end

  test "should update pump" do
    patch :update, id: @pump, pump: { description_text: @pump.description_text, flow_units: @pump.flow_units, head_units: @pump.head_units, impeller_diameter: @pump.impeller_diameter, minimum_suction: @pump.minimum_suction, pressure_units: @pump.pressure_units, pump_id: @pump.pump_id, stages: @pump.stages }
    assert_redirected_to pump_path(assigns(:pump))
  end

  test "should destroy pump" do
    assert_difference('Pump.count', -1) do
      delete :destroy, id: @pump
    end

    assert_redirected_to pumps_path
  end
end
