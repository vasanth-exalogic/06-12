class ChangeGrossToBeNumericInSal < ActiveRecord::Migration[6.0]
  def change
    change_column :pays, :gross, :decimal, default: 0
    change_column :pays, :net, :decimal, default: 0
    change_column :pays, :ctc, :decimal, default: 0
  end
end
