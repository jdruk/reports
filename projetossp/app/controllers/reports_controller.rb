class ReportsController < ApplicationController
  before_action :set_report, only: [:show, :edit, :update, :destroy]

  def general
    authorize :report, :general?
    @reports = Report.all
  end
  # GET /reports
  # GET /reports.json
  def index
    authorize :report, :index?
    @reports = Report.all
    
    # status: {aberto: 0, em_andamento:1, finalizado: 2} 
    @resquest_criminals = ResquestCriminal.where resquest_type: 0, status: 0, district_send: current_user.district
  end

  # GET /reports/1
  # GET /reports/1.json
  def show
    authorize :report, :show?
  end

  # GET /reports/new
  def new
    authorize :report, :new?
    @report = Report.new
  end

  # GET /reports/1/edit
  def edit
    authorize :report, :edit?
  end

  # POST /reports
  # POST /reports.json
  def create
    authorize :report, :create?
    @report = Report.new(report_params)
    @report.user_id = current_user.id

    respond_to do |format|
      if @report.save
        format.html { redirect_to @report, notice: 'Report was successfully created.' }
        format.json { render :show, status: :created, location: @report }
      else
        format.html { render :new }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reports/1
  # PATCH/PUT /reports/1.json
  def update
    authorize :report, :update?
    respond_to do |format|
      if @report.update(report_params)
        format.html { redirect_to @report, notice: 'Report was successfully updated.' }
        format.json { render :show, status: :ok, location: @report }
      else
        format.html { render :edit }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reports/1
  # DELETE /reports/1.json
  def destroy
    authorize :report, :destroy?
    @report.destroy
    respond_to do |format|
      format.html { redirect_to reports_url, notice: 'Report was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_report
      @report = Report.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def report_params
      params.require(:report).permit(:resquest_criminal_id, :user_id, :image_reports_attributes => [:id, :avatar, :description, :_destroy])
    end
end
