class AddUserToDetails < ActiveRecord::Migration[6.0]
  def change
    add_column :details, :user, :integer
  end
end
