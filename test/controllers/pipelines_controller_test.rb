require 'test_helper'

class PipelinesControllerTest < ActionController::TestCase
  setup do
    @pipeline = pipelines(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pipelines)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pipeline" do
    assert_difference('Pipeline.count') do
      post :create, pipeline: { density: @pipeline.density, description: @pipeline.description, diameter: @pipeline.diameter, flowrate: @pipeline.flowrate, length: @pipeline.length, lineloss: @pipeline.lineloss, name: @pipeline.name, roughness: @pipeline.roughness, total_loss: @pipeline.total_loss, viscosity: @pipeline.viscosity }
    end

    assert_redirected_to pipeline_path(assigns(:pipeline))
  end

  test "should show pipeline" do
    get :show, id: @pipeline
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pipeline
    assert_response :success
  end

  test "should update pipeline" do
    patch :update, id: @pipeline, pipeline: { density: @pipeline.density, description: @pipeline.description, diameter: @pipeline.diameter, flowrate: @pipeline.flowrate, length: @pipeline.length, lineloss: @pipeline.lineloss, name: @pipeline.name, roughness: @pipeline.roughness, total_loss: @pipeline.total_loss, viscosity: @pipeline.viscosity }
    assert_redirected_to pipeline_path(assigns(:pipeline))
  end

  test "should destroy pipeline" do
    assert_difference('Pipeline.count', -1) do
      delete :destroy, id: @pipeline
    end

    assert_redirected_to pipelines_path
  end
end
