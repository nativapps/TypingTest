class FixTryTimeRoomAndTest < ActiveRecord::Migration[5.2]
  def change
    remove_column :rooms, :tried_times
    add_column :test_banks, :try_times, :integer
  end
end
