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
      t.integer :notice
      t.string :empid
      t.string :department
      t.string :designation

      t.timestamps
    end
  end
end
