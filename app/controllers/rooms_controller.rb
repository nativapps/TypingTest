class RoomsController < ApplicationController
	before_action :authenticate_user!

	def index
		@rooms = Room.all
	end

	def show
		@room = Room.find(params[:id])
	end

	def new
		@room = Room.new
		@participants = Participant.all
	end

	def create
		@room = Room.new(room_params)
		@room.participants=params[:participants] 
			if @room.save
				redirect_to @room
			else
				render :new
			end
	end

	def edit
			@room = Room.find(params[:id])
			@participants = Participant.all
		end

		def update
		@room = Room.find(params[:id])
		@room.participants=params[:participants] 
			if @room.update(room_params)
				redirect_to rooms_path
			else
				render :edit
			end
	end

	def destroy
		@room = Room.find(params[:id])
		@room.destroy

		if @room.destroy
			redirect_to rooms_path
		else
			redirect_to @room
		end
	end

	private

	def room_params
		params.require(:room).permit(:name, :start_date, :finish_date, :tried_times, :set_limit, :participants)
	end
end