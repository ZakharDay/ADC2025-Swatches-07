class AddOriginIdToFill < ActiveRecord::Migration[8.0]
  def change
    add_column :fills, :origin_id, :integer
  end
end
