class RoomTestController < ApplicationController
    
    def index
    end

    def test
        @time = "10"
        @test = TestBank.find(1)
    end
end