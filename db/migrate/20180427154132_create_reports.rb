class CreateReports < ActiveRecord::Migration[5.2]
  def change
    create_table :reports do |t|
      t.integer :try_number
      t.integer :correct
      t.integer :incorrect
      t.integer :total_type
      t.integer :total_word
      t.integer :wpm
      t.integer :acurrancy

      t.timestamps
    end
  end
end
