class CreatePers < ActiveRecord::Migration[6.0]
  def change
    create_table :pers do |t|
      t.numeric :hra_per
      t.numeric :cca_per
      t.numeric :spl_all_per
      t.numeric :trans_all_per

      t.timestamps
    end
  end
end
