class PipelinesController < ApplicationController
  before_action :set_pipeline, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /pipelines
  # GET /pipelines.json
  def index
    if current_user.admin? then
      @pipelines = Pipeline.all
    else
      @pipelines = current_user.pipelines.all
    end
  end

  # GET /pipelines/1
  # GET /pipelines/1.json
  def show
  end

  # GET /pipelines/new
  def new
    @pipelines = current_user.pipelines.all
    @pipeline = current_user.pipelines.build
  end

  # GET /pipelines/1/edit
  def edit
  end

  # GET /pipelines/1/copy
  def copy
    pipelines = current_user.pipelines
    @pipeline = pipelines.find(params[:id])
    respond_to do |format|
      pipeline_copy = @pipeline.copy(pipelines, @pipeline)
      if pipeline_copy
        format.html { redirect_to pipelines_url, notice: "Pipeline #{@pipeline.name} was successfully copied to: #{pipeline_copy.name}." }
        format.json { head :no_content }
      else
        flash[:error] = "Pipeline copy failed."
        format.html { render :show, notice: 'Pipeline copy failed.' }
        format.json { render json: pipeline_copy.errors, status: :unprocessable_entity }
      end
    end        
  end

  # POST /pipelines
  # POST /pipelines.json
  def create
    @pipeline = current_user.pipelines.build(pipeline_params)
    @pipelines = current_user.pipelines.all
    respond_to do |format|
      if @pipeline.save
        format.html { redirect_to @pipeline, notice: 'Pipeline was successfully created.' }
        format.json { render :show, status: :created, location: @pipeline }
      else
        format.html { render :new }
        format.json { render json: @pipeline.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pipelines/1
  # PATCH/PUT /pipelines/1.json
  def update
    respond_to do |format|
      if @pipeline.update(pipeline_params)
        format.html { redirect_to @pipeline, notice: 'Pipeline was successfully updated.' }
        format.json { render :show, status: :ok, location: @pipeline }
      else
        format.html { render :edit }
        format.json { render json: @pipeline.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pipelines/1
  # DELETE /pipelines/1.json
  def destroy
    @pipeline.destroy
    respond_to do |format|
      format.html { redirect_to pipelines_url, notice: 'Pipeline was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pipeline
      @pipelines = current_user.pipelines.all
      begin
        @pipeline = Pipeline.find(params[:id])
      rescue ActiveRecord::RecordNotFound => e
        @pipeline = nil
        flash[:error] = "Pipeline #{params[:id]} cannot be found or no longer exists."
        respond_to do |format|
          format.html { redirect_to pipelines_url, notice: "Pipeline with id #{params[:id]} not found." }
          format.json { head :no_content }
        end
      end      
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pipeline_params
      params.require(:pipeline).permit(:name, :description, :length, :flowrate, :diameter, :roughness, :viscosity, :density, :lineloss, :total_loss, :number_stations)
    end
end
