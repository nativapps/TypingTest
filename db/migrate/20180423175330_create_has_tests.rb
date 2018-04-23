class CreateHasTests < ActiveRecord::Migration[5.2]
  def change
    create_table :has_tests do |t|
      t.references :room, foreign_key: true
      t.references :test_bank, foreign_key: true

      t.timestamps
    end
  end
end
