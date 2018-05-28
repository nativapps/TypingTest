class ReportMailer < ApplicationMailer 
  def send_report(report)
    mail(to: participant_find_by_id(report.participant_id).email, subject: 'Typing Test Report')
  end
end
