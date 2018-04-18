class FixColumnNameFromTestBank < ActiveRecord::Migration[5.2]
  def change
    rename_column :test_banks, :type, :type_test
  end
end