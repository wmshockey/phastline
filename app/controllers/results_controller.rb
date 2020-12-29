class ResultsController < ApplicationController
  before_action :set_result, only: [:show, :edit, :update, :destroy]
  before_action :check_for_results, only: [:summary, :step_detail, :station_detail, :station_step_detail, :station_curves, :step_flowrates, :batch_sequence, :batch_detail, :power, :step_linefill]

  # GET /results
  # GET /results.json
  def index
    @results = Result.all
  end

  # GET /results
  # GET /results.json
  def summary
    @summary_results = @simulation.summary_results_calc(@results)
  end
  
  def step_detail
    @step = params[:step].to_i
  end
  
  def station_detail
    @station_id = params[:station_id].to_i
    @results = Result.select {|r| r.simulation_id == @sim_id and r.station_id == @station_id}
  end

  def station_step_detail
    @station_id = params[:station_id].to_i
    @results = Result.select {|r| r.simulation_id == @sim_id and r.station_id == @station_id}
  end

  def station_curves
    @results = Result.select {|r| r.simulation_id == @sim_id and r.step == 1}
  end

  def step_flowrates
    @stations = @results.map {|s| s.station_id}.uniq
  end

  def batch_sequence
    @results = Result.select {|r| r.simulation_id == @sim_id and r.step == 1}
  end

  def batch_detail
    @batch = params[:batch]
    @results = Result.select {|r| r.simulation_id == @sim_id and r.step == 1}
  end
  
  def power
  end
  
  def step_linefill
    @step = params[:step].to_i
  end

  # GET /results/1
  # GET /results/1.json
  def show
  end

  # GET /results/new
  def new
    @result = Result.new
  end

  # GET /results/1/edit
  def edit
  end

  # POST /results
  # POST /results.json
  def create
    @result = Result.new(result_params)

    respond_to do |format|
      if @result.save
        format.html { redirect_to @result, notice: 'Result was successfully created.' }
        format.json { render :show, status: :created, location: @result }
      else
        format.html { render :new }
        format.json { render json: @result.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /results/1
  # PATCH/PUT /results/1.json
  def update
    respond_to do |format|
      if @result.update(result_params)
        format.html { redirect_to @result, notice: 'Result was successfully updated.' }
        format.json { render :show, status: :ok, location: @result }
      else
        format.html { render :edit }
        format.json { render json: @result.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /results/1
  # DELETE /results/1.json
  def destroy
    @result.destroy
    respond_to do |format|
      format.html { redirect_to results_url, notice: 'Result was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_result
      @result = Result.find(params[:id])
    end
    
    def check_for_results
      @sim_id = params[:id].to_i
      @simulation = Simulation.find(params[:id])
      @pipeline = Pipeline.find(@simulation.pipeline_id)
      @results = Result.select {|r| r.simulation_id == @sim_id}
      if @results.empty?
        respond_to do |format|
          flash[:error] = "No simulation results available at this point, please run a simulation"
          format.html { redirect_to @simulation, notice: 'No Simulation Results Available'}
          format.json {head :no_content}
        end
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def result_params
            params.require(:result).permit(:simulation_id, :simulation_name, :step, :timestamp, :step_time, :kmp, :station_id, :stat, :flow, :pumped_volume, :upstream_batch, :downstream_batch, :hold, :suct, :head, :casep, :disc, :max_disc_pressure, :min_pressure_violation, :min_pressure_point, :max_pressure_violation, :max_pressure_point, :total_static_loss, :total_dynamic_loss, :hhp, :linefill)
    end
end
