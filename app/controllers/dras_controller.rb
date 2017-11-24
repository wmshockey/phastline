class DrasController < ApplicationController
  before_action :set_dra, only: [:show, :edit, :update, :destroy]

  # GET /dras
  # GET /dras.json
  def index
    @pipeline = Pipeline.find(params[:pipeline_id])
    @dras = @pipeline.dras.all
  end

  # GET /dras/1
  # GET /dras/1.json
  def show
  end

  # GET /dras/new
  def new
    @pipeline = Pipeline.find(params[:pipeline_id])
    @dra = @pipeline.dras.build
  end

  # GET /dras/1/edit
  def edit
  end

  # POST /dras
  # POST /dras.json
  def create
    @pipeline = Pipeline.find(params[:pipeline_id])
    @dra = @pipeline.dras.new(dra_params)

    respond_to do |format|
      if @dra.save
        format.html { redirect_to pipeline_dras_path(@pipeline), notice: 'Dra was successfully created.' }
        format.json { render :show, status: :created, location: @dra }
      else
        format.html { render :new }
        format.json { render json: @dra.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dras/1
  # PATCH/PUT /dras/1.json
  def update
    respond_to do |format|
      if @dra.update(dra_params)
        format.html { redirect_to pipeline_dras_path(@pipeline), notice: 'Dra was successfully updated.' }
        format.json { render :show, status: :ok, location: @dra }
      else
        format.html { render :edit }
        format.json { render json: @dra.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dras/1
  # DELETE /dras/1.json
  def destroy
    respond_to do |format|
      if @dra.destroy
        format.html { redirect_to pipeline_dras_path(@pipeline), notice: 'Dra was successfully deleted.' }
        format.json { render :show, status: :destroyed, location: @pipeline }
      else
        format.html { render :delete }
        format.json { render json: @dra.errors, status: :unprocessable_entity }
      end
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dra
       @pipeline = Pipeline.find(params[:pipeline_id])
       begin
         @dra = @pipeline.dras.find(params[:id])
       rescue ActiveRecord::RecordNotFound => e
         @dra = nil
         flash[:error] = "Dra #{params[:id]} cannot be found or no longer exists."
         respond_to do |format|
           format.html { redirect_to pipeline_dras_path(@pipeline), notice: "Dra with id #{params[:id]} not found." }
           format.json { head :no_content }
         end
       end                
     end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dra_params
      params.require(:dra).permit(:start_kmp, :end_kmp, :dra_percent)
    end
end
