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
      format.html { redirect_to pipelines_url, notice: 'Pipeline was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pipeline
      @pipelines = current_user.pipelines.all
      @pipeline = Pipeline.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pipeline_params
      params.require(:pipeline).permit(:name, :description, :length, :flowrate, :diameter, :roughness, :viscosity, :density, :lineloss, :total_loss)
    end
end
