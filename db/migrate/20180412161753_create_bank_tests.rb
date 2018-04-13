class CreateBankTests < ActiveRecord::Migration[5.2]
  def change
    create_table :bank_tests do |t|
      t.string :name
      t.string :type_test
      t.text :text_test

      t.timestamps
    end
  end
end
