class CreateComments < ActiveRecord::Migration[8.1]
  def change
    create_table :comments do |t|
      t.text :body
      t.integer :commentable_id
      t.string :commentable_type
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
