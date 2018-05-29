class Room < ApplicationRecord
  has_many :has_participants
  has_many :participants, through: :has_participants

  has_many :has_tests
  has_many :test_banks, through: :has_tests

  after_create :save_participants
  after_update :update_participants

  after_create :save_test_banks
  after_update :update_test_banks

  def participants=(value)
    @participants = value
  end

  def test_banks=(value)
    @test_banks = value
  end

  private

  def save_participants
    if @participants.blank?
      # This is empty for now, need to fix (rubocop)
    else
      @participants.each do |participant_id|
        HasParticipant.create(participant_id: participant_id, room_id: self.id)
      end
    end
  end

  def update_participants
    if !@participants.blank?
      @participants.each do |participant_id|
        HasParticipant.where("room_id=? AND participant_id=?", self.id, participant_id.to_i).delete_all
        HasParticipant.create(participant_id: participant_id, room_id: self.id)
      end
    end
  end

  def save_test_banks
    if @test_banks.blank?
      # This is empty for now, need to fix (rubocop)
    else
      @test_banks.each do |test_bank_id|
        HasTest.create(test_bank_id: test_bank_id, room_id: self.id)
      end
    end
  end

  def update_test_banks
    if !@test_banks.blank?
      @test_banks.each do |test_bank_id|
        HasTest.where("room_id=? AND test_bank_id=?", self.id, test_bank_id.to_i).delete_all
        HasTest.create(test_bank_id: test_bank_id, room_id: self.id)
      end
    end
  end
end
