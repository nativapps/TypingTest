class InvitationMailer < ApplicationMailer
  #default from: 'invitacion@example.com'
 
  def invitation_email(room)
    room = room
    if !room.nil?
      room.participants.each do |participant|
        @participant = participant
        mail(to: participant.email, subject: 'Mensagge of the invitation')
      end
    end
  end
end