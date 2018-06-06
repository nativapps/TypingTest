class RoomTestController < ApplicationController
  before_action :authenticate_participant!, :except => [:index]

  def index
    # This def is only for show the main page
  end

  def lobby
    if current_participant.rooms 
      @lobby_rooms = current_participant.rooms
      render
    else
      @hola = 'nada paso!'
    end
  end

  def rooms
    if current_participant.rooms.find(room_id).start_date <= Date.today && current_participant.rooms.find(room_id).finish_date >= Date.today
      @tests = current_participant.rooms.find(room_id).test_banks
      @room_id = room_id
      @mensaje= current_participant.rooms.find(room_id).start_date
    else
      @mensaje = 'no era la fecha permitida'
      @tests = []
    end
  end

  def test
    if current_participant
      @time = current_participant.rooms.find(room_id).set_limit
      @test = TestBank.find(params[:test_id])
      # @try = current_participant.rooms.find(room_id).test_banks.find(test_id).try_times
      try = ParticipantTest.where("participant_id = #{current_participant.id} AND test_bank_id = #{test_id} AND room_id = #{room_id}")
      if try.first.try_number >= 0
        try.update(try_number: try.first.try_number - 1)
        render
      else
        flash[:notice] = "Your try time is limited"
        redirect_to root_path
      end
    else
      redirect_to root_path
    end
  end

  private

  def room_id
    return params[:room_id]
  end

  def test_id
    return params[:test_id]
  end
end