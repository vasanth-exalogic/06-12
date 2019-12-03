class ChangeNetToBeNumericInSal < ActiveRecord::Migration[6.0]
  def change
    change_column :pays, :gross, :decimal
    change_column :pays, :net, :decimal
    change_column :pays, :ctc, :decimal
  end
end
