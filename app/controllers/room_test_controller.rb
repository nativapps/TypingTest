class RoomTestController < ApplicationController
    def index
        @time = "10"
        @test = TestBank.find(1)
    end
end