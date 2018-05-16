class AddParticipantConfirmable < ActiveRecord::Migration[5.2]
  def self.up
    add_column :participants, :confirmation_token, :string
    add_column :participants, :confirmed_at, :datetime
    add_column :participants, :confirmation_sent_at, :datetime
    # add_column :participants, :unconfirmed_email, :string # Only if using reconfirmable
    add_index :participants, :confirmation_token, :unique => true

    Participant.update_all({:confirmed_at => DateTime.now, :confirmation_sent_at => DateTime.now})
  end

  def self.down
    remove_column :participants, [:confirmed_at, :confirmation_token, :confirmation_sent_at]
  end
end
