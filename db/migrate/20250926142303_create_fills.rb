class CreateFills < ActiveRecord::Migration[8.1]
  def change
    create_table :fills do |t|
      t.string :name
      t.belongs_to :user, null: false, foreign_key: true
      t.integer :origin_id

      t.timestamps
    end
  end
end
