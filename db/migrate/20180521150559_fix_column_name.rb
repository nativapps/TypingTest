class FixColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :reports, :acurrancy, :accuracy
  end
end
