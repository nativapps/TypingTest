class RoomsController < ApplicationController
  before_action :authenticate_user!

  def index
    @rooms = if params[:name]
      Room.where('LOWER(name) LIKE LOWER(?)', "%#{params[:name]}%").page(params[:page])
    else
      Room.all.page(params[:page])
    end
  end

  def show
    @room = Room.find(params[:id])
  end

  def new
    @name = "ROOM";
    @room = Room.new
    @participants = Participant.all
    @test_banks = TestBank.all
  end

  def create
    @room = Room.new(room_params)
    @room.participants=params[:participants]
    @room.test_banks=params[:test_banks] 
    if @room.save
      redirect_to @room
    else
      render :new
    end
  end

  def edit
    @room = Room.find(params[:id])
    @participants = Participant.all
    @test_banks = TestBank.all
  end

	def update
		@room = Room.find(params[:id])
		@room.participants=params[:participants]
		@room.test_banks=params[:test_banks]
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

  def send_invitation
    @room = Room.find(room_id)
    InvitationMailer.invitation_email(@room).deliver_later
    flash[:notice] = "email has been sent."
    redirect_to room_path(@room.id)
  end

  private

  def room_params
    params.require(:room).permit(:name, :start_date, :finish_date, :set_limit, :participants, :test_banks)
  end

  def room_id
    return params[:room_id]
  end
end