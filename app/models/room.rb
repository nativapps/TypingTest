class Room < ApplicationRecord
  has_many :has_participants
  has_many :participants, through: :has_participants

  has_many :has_tests
  has_many :test_banks, through: :has_tests

  after_create :save_participants
  after_update :update_participants
  before_destroy :destroy_participants

  after_create :save_test_banks
  after_update :update_test_banks
  before_destroy :destroy_has_test


  def participants=(value)
    @participants = value
  end

  def test_banks=(value)
    @test_banks = value
  end

  private

  def save_participants
    unless @participants.blank?
      @participants.each do |participant_id|
        HasParticipant.create(participant_id: participant_id.to_i, room_id: id)
      end
    end
  end

  def update_participants
    unless @participants.blank?
      HasParticipant.where("room_id=?", id).delete_all
      @participants.each do |participant_id|
        HasParticipant.create(participant_id: participant_id, room_id: id)
      end
    end
  end

  def destroy_participants
    HasParticipant.where("room_id=?", id).delete_all
  end

  def save_test_banks
    unless @test_banks.blank?
      @test_banks.each do |test_bank_id|
        HasTest.create(test_bank_id: test_bank_id, room_id: id)
      end
    end
  end

  def update_test_banks
    HasTest.where("room_id=?", id).delete_all
    unless @test_banks.blank?
      @test_banks.each do |test_bank_id|
        HasTest.create(test_bank_id: test_bank_id, room_id: id)
      end
    end
  end

  def destroy_has_test
    HasTest.where("room_id=?", id).delete_all
  end
end
