class CreatePays < ActiveRecord::Migration[6.0]
  def change
    create_table :pays do |t|
      t.numeric :basic
      t.numeric :hra
      t.numeric :cca
      t.numeric :spl_all
      t.numeric :trans_all
      t.numeric :reimb
      t.numeric :i_tax
      t.numeric :p_tax
      t.numeric :lop
      t.numeric :deduction
      t.numeric :gross
      t.numeric :net
      t.numeric :ctc

      t.timestamps
    end
  end
end
