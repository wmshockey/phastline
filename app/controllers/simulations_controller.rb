class SimulationsController < ApplicationController
  before_action :set_simulation, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /simulations
  # GET /simulations.json
  def index
    @simulations = current_user.simulations.all
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

  # GET /simulations/1/run
  def run
    @simulation = Simulation.find(params[:id])
    pipeline = current_user.pipelines.find{|p| p.id == @simulation.pipeline_id}
    schedule = current_user.schedules.find{|s| s.id == @simulation.schedule_id}
    nomination = current_user.nominations.find{|n| n.id == @simulation.nomination_id}
    commodities = current_user.commodities
    units = pipeline.units
    pumpar = current_user.pumps
    respond_to do |format|
      if @simulation.run(pipeline, schedule, nomination, commodities, units, pumpar)
        flash[:success] = "Simulation ran successfully."
        format.html { render :run, status: :ok, location: @simulation }
        format.json { render :run, status: :ok, location: @simulation }
      else
        flash[:error] = "Simulation run failed."
        format.html { render :run, notice: 'Simulation run failed.' }
        format.json { render json: @simulation.errors, status: :unprocessable_entity }
      end
    end
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
      format.html { redirect_to simulations_url, notice: 'Simulation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_simulation
      @simulations = current_user.simulations.all
      @simulation = Simulation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def simulation_params
      params.require(:simulation).permit(:name, :description, :pipeline_id, :nomination_id, :schedule_id, :max_flowrate, :max_batchsize)
    end
end
