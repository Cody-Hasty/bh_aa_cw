class AddIndexToTrack < ActiveRecord::Migration[5.2]
  def change
    add_column :tracks, :album_id, :integer
    add_column :tracks, :band_id, :integer
    add_index :tracks, :album_id
    add_index :tracks, :band_id
  end
end
