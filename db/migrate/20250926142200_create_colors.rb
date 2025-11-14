class CreateColors < ActiveRecord::Migration[8.1]
  def change
    create_table :colors do |t|
      t.string :rgb_hash
    end

    add_index :colors, :id
    add_index :colors, :rgb_hash
  end
end
