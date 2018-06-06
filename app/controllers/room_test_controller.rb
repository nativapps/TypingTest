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
      @time = "Hola " # current_participant.rooms.find(room_id).tried_times
      @test = TestBank.find(params[:test_id])
      render
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
