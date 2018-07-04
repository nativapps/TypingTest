class ConfirmationsController < Devise::ConfirmationsController
  def show
    @participant = Participant.find_by_confirmation_token(params[:confirmation_token])
    unless @participant.blank?
      render "participants/confirmations/new"
    else
      render json: {message: "Token is invalid"}
    end
  end
end