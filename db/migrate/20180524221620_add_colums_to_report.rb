class AddColumsToReport < ActiveRecord::Migration[5.2]
  def change
    add_column :reports, :room_id, :integer
    add_column :reports, :test_id, :integer
  end
end
