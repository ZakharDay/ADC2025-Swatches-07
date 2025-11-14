class CreateSwatchFills < ActiveRecord::Migration[8.1]
  def change
    create_table :swatch_fills do |t|
      t.belongs_to :swatch, null: false, foreign_key: true
      t.belongs_to :fill, null: false, foreign_key: true
      # position

      t.timestamps
    end
  end
end
