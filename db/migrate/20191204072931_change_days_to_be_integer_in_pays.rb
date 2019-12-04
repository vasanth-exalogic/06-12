class ChangeDaysToBeIntegerInPays < ActiveRecord::Migration[6.0]
  def change
    change_column :pays, :days, :integer, :default => 0
  end
end
