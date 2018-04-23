class AddIdentificationToParticipants < ActiveRecord::Migration[5.2]
  def change
    add_column :participants, :identification, :integer
  end
end
