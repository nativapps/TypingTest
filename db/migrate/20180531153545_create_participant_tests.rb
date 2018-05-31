class CreateParticipantTests < ActiveRecord::Migration[5.2]
  def change
    create_table :participant_tests do |t|
      t.references :participant, foreign_key: true
      t.references :test_bank, foreign_key: true

      t.timestamps
    end
  end
end
