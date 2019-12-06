class AddPayIdToPays < ActiveRecord::Migration[6.0]
  def change
    add_column :pays, :pay_id, :string
  end
end
