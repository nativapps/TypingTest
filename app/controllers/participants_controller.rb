class ParticipantsController < ApplicationController
	before_action :authenticate_user!, except: [:update]

	def index
		@participants = Participant.all
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
			debugger
			@participant.confirm
			redirect_to :root
		elsif @participant.update(participant_params)
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
											:email, :password, :password_confirmation)
	end
end