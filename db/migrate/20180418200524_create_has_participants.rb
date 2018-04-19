class CreateHasParticipants < ActiveRecord::Migration[5.2]
  def change
    create_table :has_participants do |t|
      t.references :room, foreign_key: true
      t.references :participant, foreign_key: true

      t.timestamps
    end
  end
end
