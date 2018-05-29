class TestBanksController < ApplicationController
  before_action :authenticate_user!

  def index
    @tests = TestBank.page(params[:page])
  end

  def show
    @test = TestBank.find(params[:id])
  end

  def new
    @test = TestBank.new
  end

  def create
    @test = TestBank.new(test_params)
    if @test.save
      redirect_to @test
    else
      render :new
    end
  end

  def edit
    @test = TestBank.find(params[:id])
  end

  def update
    @test = TestBank.find(params[:id])
    if @test.update(test_params)
      redirect_to test_banks_path
    else
      render :edit
    end
  end

  def destroy
    @test = TestBank.find(params[:id])
    @test.destroy

    if @test.destroy
      redirect_to test_banks_path
    else
    redirect_to @test
    end
  end

  private

  def test_params
    params.require(:test_bank).permit(:name, :type_test, :text_test)
  end
end