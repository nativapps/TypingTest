class ReportMailer < ApplicationMailer 
  def send_report(report)
    @report = report
    mail(to: Participant.find_by_id(report.participant_id).email, subject: 'Typing Test Report')
  end
end
