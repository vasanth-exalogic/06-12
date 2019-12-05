class RemoveColumnsFromDetails < ActiveRecord::Migration[6.0]
  def change
    remove_column :details, :ename
    remove_column :details, :econtact
    remove_column :details, :relation
    remove_column :details, :pskill
    remove_column :details, :sskill1
    remove_column :details, :sskill2
  end
end
