class AddUserToPays < ActiveRecord::Migration[6.0]
  def change
    add_column :pays, :user_id, :integer
  end
end
