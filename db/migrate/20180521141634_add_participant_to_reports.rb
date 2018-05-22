class AddParticipantToReports < ActiveRecord::Migration[5.2]
  def change
    add_reference :reports, :participant, foreign_key: true
  end
end
