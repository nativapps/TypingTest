class FixTryTimeRoomAndTest < ActiveRecord::Migration[5.2]
  def change
    add_column :test_banks, :try_times, :integer
  end
end
