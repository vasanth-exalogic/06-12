class AddDaysToPays < ActiveRecord::Migration[6.0]
  def change
    add_column :pays, :days, :integer
  end
end
