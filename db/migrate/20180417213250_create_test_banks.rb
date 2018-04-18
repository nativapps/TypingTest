class CreateTestBanks < ActiveRecord::Migration[5.2]
  def change
    create_table :test_banks do |t|
      t.string :name
      t.string :type
      t.text :text_test

      t.timestamps
    end
  end
end
