class CreateAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :accounts do |t|
      t.string :accno
      t.string :bank
      t.string :branch
      t.string :ifsc
      t.string :accname

      t.timestamps
    end
  end
end
