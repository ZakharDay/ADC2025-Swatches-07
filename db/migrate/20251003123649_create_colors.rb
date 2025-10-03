class CreateColors < ActiveRecord::Migration[8.0]
  def change
    create_table :colors do |t|
      t.integer :stop
      t.string :color
      t.integer :alpha
      t.references :fill, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
