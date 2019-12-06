class AddDateToPays < ActiveRecord::Migration[6.0]
  def change
    add_column :pays, :month, :integer
    add_column :pays, :year, :integer
  end
end
