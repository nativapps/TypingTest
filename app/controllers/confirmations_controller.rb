class ConfirmationsController < Devise::ConfirmationsController
  def show
    @participant = Participant.find_by_confirmation_token(params[:confirmation_token])
    render "participants/confirmations/new"
  end
end