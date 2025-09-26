class CreateSwatches < ActiveRecord::Migration[8.0]
  def change
    create_table :swatches do |t|
      t.string :name
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
