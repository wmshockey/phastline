class NominationsController < ApplicationController
  before_action :set_nomination, only: [:show, :edit, :update, :destroy]

  # GET /nominations
  # GET /nominations.json
  def index
    if current_user.admin? then
      @pipelines = Pipeline.all
      @nominations = Nomination.all
    else
      @pipelines = current_user.pipelines.all
      @nominations = current_user.nominations.all
    end
  end

  # GET /nominations/1
  # GET /nominations/1.json
  def show
  end

  # GET /nominations/new
  def new
    @pipelines = current_user.pipelines.all
    @nominations = current_user.nominations.all
    @nomination = Nomination.new
  end

  # GET /nominations/1/edit
  def edit
  end

  # GET /nominations/1/copy
  def copy
    nominations = current_user.nominations
    @nomination = nominations.find(params[:id])
    respond_to do |format|
      nomination_copy = @nomination.copy(nominations, @nomination)
      if nomination_copy
        format.html { redirect_to nominations_url, notice: "Nomination #{@nomination.name} was successfully copied to: #{nomination_copy.name}." }
        format.json { head :no_content }
      else
        flash[:error] = "Nomination copy failed."
        format.html { render :show, notice: 'Nomination copy failed.' }
        format.json { render json: nomination_copy.errors, status: :unprocessable_entity }
      end
    end        
  end

  # POST /nominations
  # POST /nominations.json
  def create
    @nomination = Nomination.new(nomination_params)
    @pipelines = current_user.pipelines.all
    @nominations = current_user.nominations.all

    respond_to do |format|
      if @nomination.save
        format.html { redirect_to @nomination, notice: 'Nomination was successfully created.' }
        format.json { render :show, status: :created, location: @nomination }
      else
        format.html { render :new }
        format.json { render json: @nomination.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nominations/1
  # PATCH/PUT /nominations/1.json
  def update
    respond_to do |format|
      if @nomination.update(nomination_params)
        format.html { redirect_to @nomination, notice: 'Nomination was successfully updated.' }
        format.json { render :show, status: :ok, location: @nomination }
      else
        format.html { render :edit }
        format.json { render json: @nomination.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nominations/1
  # DELETE /nominations/1.json
  def destroy
    @nomination.destroy
    respond_to do |format|
      format.html { redirect_to nominations_url, notice: 'Nomination was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nomination
      begin
        @nomination = Nomination.find(params[:id])
      rescue ActiveRecord::RecordNotFound => e
        @nomination = nil
        flash[:error] = "Nomination #{params[:id]} cannot be found or no longer exists."
        respond_to do |format|
          format.html { redirect_to nominations_url, notice: "Nomination with id #{params[:id]} not found." }
          format.json { head :no_content }
        end
      end
      if !@nomination.nil?
        @pipeline = Pipeline.find {|p| p.id == @nomination.pipeline_id }  
      end    
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def nomination_params
      params.require(:nomination).permit(:name, :description, :nom_date, :period, :pipeline_id)
    end
end
