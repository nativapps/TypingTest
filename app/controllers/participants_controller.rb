class ParticipantsController < ApplicationController
  before_action :authenticate_user!, except: [:update]

  def index
    @participants = if params[:search]
      Participant.where('LOWER(first_name) LIKE LOWER(:search) OR LOWER(last_name) LIKE LOWER(:search)', search: "%#{params[:search]}%").page(params[:page])
    else
      Participant.all.page(params[:page])
    end
  end

  def show
    @participant = Participant.find(params[:id])
  end

  def new
    @participant = Participant.new
  end

  def create
    @participant = Participant.new(participant_params)
    if @participant.save
      redirect_to @participant
    else
      render :new
    end
  end

  def edit
    @participant = Participant.find(params[:id])
  end

  def update
    @participant = Participant.find(params[:id])
    if @participant.update(participant_params) && !@participant.confirmed?
      @participant.confirm
      redirect_to :root
    elsif @participant.update(participant_params)
      @participant.update_attribute(:confirmation_token,
        Devise.token_generator.generate(Participant, :confirmation_token)[0])
      redirect_to participants_path
    else
      render :edit
    end
  end

  def destroy
    @participant = Participant.find(params[:id])
    @participant.destroy

    if @participant.destroy
      redirect_to participants_path
    else
      redirect_to @participant
    end
  end

  private

  def participant_params
    params.require(:participant).permit(:first_name, :last_name, :identification, :phone, 
                      :email, :password, :password_confirmation, :search)
  end
end