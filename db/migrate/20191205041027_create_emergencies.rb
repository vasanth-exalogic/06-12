class CreateEmergencies < ActiveRecord::Migration[6.0]
  def change
    create_table :emergencies do |t|
      t.string :ename
      t.string :econtact
      t.string :relation
      t.string :pskill
      t.string :sskill1
      t.string :sskill2

      t.timestamps
    end
  end
end
