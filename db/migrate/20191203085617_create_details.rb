class CreateDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :details do |t|
      t.string :fname
      t.string :lname
      t.date :dob
      t.date :doj
      t.string :bloodtype
      t.string :contact
      t.string :gender
      t.text :address
      t.string :state
      t.string :city
      t.string :country
      t.string :pincode
      t.string :ename
      t.string :econtact
      t.string :pskill
      t.string :sskill1
      t.string :sskill2
      t.integer :notice
      t.string :relation

      t.timestamps
    end
  end
end
