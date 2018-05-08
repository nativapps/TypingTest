class ReportsController < ApplicationController
  def index
    @report = Report.all
	end

	def edit
		@report = Report.find(params[:id])
	end
	
  def create
    @report = Report.new(report_params)
		if @report.save
			redirect_to @report
		else
			render :new
		end
	end
	
  def destroy
    @report = Report.find(params[:id])
		@report.destroy
		if @report.destroy
			redirect_to report_banks_path
		else
  		redirect_to @report
		end
	end
	
	private

	def report_params
		params.require(:report).permit(:try_number, :correct, :incorrect: :total_typed, :total_word, :wpm, :acurrancy)
	end
end