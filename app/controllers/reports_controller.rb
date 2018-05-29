class ReportsController < ApplicationController
  def index
    @search = Report.ransack(params[:q])
    @reports = @search.result(distinct: true).page(params[:page])
    # @reports = @search.result.includes(:rooms)

    @search.build_condition
  end

  def edit
    @report = Report.find(params[:id])
  end

  def create
    @report = Report.new(report_params)
    if @report.save
      ReportMailer.send_report(@report).deliver
      redirect_to :room_test_lobby
    else
      render json: {Message: "Report results were not saved succesfully. Please contact the administrator or the person in charge of your test."}
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
      redirect_to reports_path
    else
      redirect_to @report
    end
  end

  private

  def report_params
    params.require(:report).permit(:try_number, :correct, :incorrect, :total_type, :total_word, :wpm, :accuracy, :participant_id, :room_id, :test_id, :term)
  end
end
