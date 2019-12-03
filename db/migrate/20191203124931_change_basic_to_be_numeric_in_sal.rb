class ChangeBasicToBeNumericInSal < ActiveRecord::Migration[6.0]
  def change
    change_column :pays, :basic, :decimal, default: 0
    change_column :pays, :hra, :decimal, default: 0
    change_column :pays, :cca, :decimal, default: 0
    change_column :pays, :spl_all, :decimal, default: 0
    change_column :pays, :trans_all, :decimal, default: 0
    change_column :pays, :reimb, :decimal, default: 0
    change_column :pays, :lop, :decimal, default: 0
    change_column :pays, :i_tax, :decimal, default: 0
    change_column :pays, :p_tax, :decimal, default: 0
    change_column :pays, :deduction, :decimal, default: 0
  end
end
