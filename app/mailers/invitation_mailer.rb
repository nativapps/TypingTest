class InvitationMailer < ApplicationMailer
  default from: 'invitacion@example.com'
 
  def invitation_email(participant)
  	@participant = participant
    mail(to: "usuario@email.com", subject: 'Mensagge of the invitation')
  end
end