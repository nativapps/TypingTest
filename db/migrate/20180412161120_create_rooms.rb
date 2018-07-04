class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.string :name
      t.date :start_date
      t.date :finish_date
      t.string :set_limit

      t.timestamps
    end
  end
end
