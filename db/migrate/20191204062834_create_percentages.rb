class CreatePercentages < ActiveRecord::Migration[6.0]
  def change
    create_table :percentages do |t|
      t.numeric :hra, :default => 0
      t.numeric :cca, :default => 0
      t.numeric :spl_all, :default => 0
      t.numeric :trans_all, :default => 0

      t.timestamps
    end
  end
end
