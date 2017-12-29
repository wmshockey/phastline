class SimulationsController < ApplicationController
  before_action :set_simulation, only: [:show, :edit, :update, :destroy, :run]
  before_action :authenticate_user!

  # GET /simulations
  # GET /simulations.json
  def index
    if current_user.admin? then
      @simulations = Simulation.all
    else
      @simulations = current_user.simulations.all
    end
  end

  # GET /simulations/1
  # GET /simulations/1.json
  def show
  end

  # GET /simulations/new
  def new
    @simulations = current_user.simulations.all
    @simulation = current_user.simulations.build
  end

  # GET /simulations/1/edit
  def edit
  end

  # GET /simulations/1/copy
  def copy
    simulations = current_user.simulations
    @simulation = simulations.find(params[:id])
    respond_to do |format|
      simulation_copy = @simulation.copy(simulations, @simulation)
      if simulation_copy
        format.html { redirect_to simulations_url, notice: "Simulation #{@simulation.name} was successfully copied to: #{simulation_copy.name}." }
        format.json { head :no_content }
      else
        flash[:error] = "Simulation copy failed."
        format.html { render :show, notice: 'Simulation copy failed.' }
        format.json { render json: simulation_copy.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /simulations/1/run
  def run
    if current_user.admin? then
      @simulation = Simulation.find(params[:id])
    else
      @simulation = current_user.simulations.find(params[:id])
    end
    @progress_bar = current_user.progressbars.create!(message: "Queued Simulation \"#{@simulation.name}\" for processing.", percent: 0)
    SimWorker.perform_later(current_user, @simulation, @progress_bar)
  end

  # POST /simulations
  # POST /simulations.json
  def create
    @simulations = current_user.simulations.all
    @simulation = current_user.simulations.build(simulation_params)
    respond_to do |format|
      if @simulation.save
        format.html { redirect_to simulations_path, notice: 'Simulation was successfully created.' }
        format.json { render :show, status: :created, location: @simulation }
      else
        format.html { render :new }
        format.json { render json: @simulation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /simulations/1
  # PATCH/PUT /simulations/1.json
  def update
    respond_to do |format|
      if @simulation.update(simulation_params)
        format.html { redirect_to simulation_path(@simulation), notice: 'Simulation was successfully updated.' }
        format.json { render :show, status: :ok, location: @simulation }
      else
        format.html { render :edit }
        format.json { render json: @simulation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /simulations/1
  # DELETE /simulations/1.json
  def destroy
    @simulation.destroy
    respond_to do |format|
      format.html { redirect_to simulations_url, notice: 'Simulation was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_simulation
      @simulations = current_user.simulations.all
      begin
        @simulation = Simulation.find(params[:id])
      rescue ActiveRecord::RecordNotFound => e
        @simulation = nil
        flash[:error] = "Simulation #{params[:id]} cannot be found or no longer exists."
        respond_to do |format|
          format.html { redirect_to simulations_url, notice: "Simulation with id #{params[:id]} not found." }
          format.json { head :no_content }
        end
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def simulation_params
      params.require(:simulation).permit(:name, :description, :pipeline_id, :nomination_id, :max_flowrate, :max_batchsize, :max_steptime, :flow_unit, :vol_unit, :dist_unit, :pres_unit, :energy_unit, :power_unit, :pmphead_unit, :pmpflow_unit)
    end
end
