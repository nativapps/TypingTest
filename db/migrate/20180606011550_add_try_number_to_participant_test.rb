class AddTryNumberToParticipantTest < ActiveRecord::Migration[5.2]
  def change
    add_column :participant_tests, :try_number, :integer
  end
end
