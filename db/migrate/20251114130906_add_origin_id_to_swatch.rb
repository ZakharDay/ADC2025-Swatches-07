class AddOriginIdToSwatch < ActiveRecord::Migration[8.0]
  def change
    add_column :swatches, :origin_id, :integer
  end
end
