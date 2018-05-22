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
			puts "It works"
			#redirect_to @report
		else
			puts "Not saved"
			#render :new
		end
	end
	
#	def update
#    @report = User.find(params[:id])
#    if @user.update_attributes(report_params)
#      # Handle a successful update.
#    else
#      render 'edit'
#    end
#	end

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
		params.require(:report).permit(:try_number, :correct, :incorrect, :total_type, 
																	 :total_word, :wpm, :accuracy, :participant_id)
	end
end