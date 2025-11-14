class CreateSwatches < ActiveRecord::Migration[8.1]
  def change
    create_table :swatches do |t|
      t.string :name
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :project, foreign_key: true
      t.integer :origin_id

      t.timestamps
    end
  end
end
