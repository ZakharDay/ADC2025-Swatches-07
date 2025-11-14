class CreateSwatches < ActiveRecord::Migration[8.0]
  def change
    create_table :swatches do |t|
      t.string :name
      t.belongs_to :user, foreign_key: true
      t.integer :project_id

      t.timestamps
    end
  end
end
