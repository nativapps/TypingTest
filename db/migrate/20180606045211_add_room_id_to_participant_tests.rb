class AddRoomIdToParticipantTests < ActiveRecord::Migration[5.2]
  def change
    add_column :participant_tests, :room_id, :integer
  end
end
