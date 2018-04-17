class TestBanksController < ApplicationController
    def index
        @test = TestBank.all
    end
end