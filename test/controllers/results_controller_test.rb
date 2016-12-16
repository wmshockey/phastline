require 'test_helper'

class ResultsControllerTest < ActionController::TestCase
  setup do
    @result = results(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:results)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create result" do
    assert_difference('Result.count') do
      post :create, result: { casep: @result.casep, disc: @result.disc, downstream_batch: @result.downstream_batch, flow: @result.flow, head: @result.head, hold: @result.hold, kmp: @result.kmp, max_disc_pressure: @result.max_disc_pressure, max_pressure_point: @result.max_pressure_point, max_pressure_violation: @result.max_pressure_violation, min_pressure_point: @result.min_pressure_point, min_pressure_violation: @result.min_pressure_violation, pumped_volume: @result.pumped_volume, simulation_id: @result.simulation_id, simulation_name: @result.simulation_name, stat: @result.stat, station_id: @result.station_id, step: @result.step, suct: @result.suct, timestamp: @result.timestamp, total_dynamic_loss: @result.total_dynamic_loss, total_static_loss: @result.total_static_loss, upstream_batch: @result.upstream_batch }
    end

    assert_redirected_to result_path(assigns(:result))
  end

  test "should show result" do
    get :show, id: @result
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @result
    assert_response :success
  end

  test "should update result" do
    patch :update, id: @result, result: { casep: @result.casep, disc: @result.disc, downstream_batch: @result.downstream_batch, flow: @result.flow, head: @result.head, hold: @result.hold, kmp: @result.kmp, max_disc_pressure: @result.max_disc_pressure, max_pressure_point: @result.max_pressure_point, max_pressure_violation: @result.max_pressure_violation, min_pressure_point: @result.min_pressure_point, min_pressure_violation: @result.min_pressure_violation, pumped_volume: @result.pumped_volume, simulation_id: @result.simulation_id, simulation_name: @result.simulation_name, stat: @result.stat, station_id: @result.station_id, step: @result.step, suct: @result.suct, timestamp: @result.timestamp, total_dynamic_loss: @result.total_dynamic_loss, total_static_loss: @result.total_static_loss, upstream_batch: @result.upstream_batch }
    assert_redirected_to result_path(assigns(:result))
  end

  test "should destroy result" do
    assert_difference('Result.count', -1) do
      delete :destroy, id: @result
    end

    assert_redirected_to results_path
  end
end
