class CreateFillColors < ActiveRecord::Migration[8.1]
  def change
    create_table :fill_colors do |t|
      t.belongs_to :fill, null: false, foreign_key: true
      t.belongs_to :color, null: false, foreign_key: true
      t.integer :stop
      t.integer :alpha
      # position

      t.timestamps
    end
  end
end
