class CreateSells < ActiveRecord::Migration[7.2]
  def change
    create_table :sells do |t|
      t.integer :quantity, null: false
      t.string :day, null: false
      t.decimal :total
      t.references :book, null: false, foreign_key: true

      t.timestamps
    end
  end
end
