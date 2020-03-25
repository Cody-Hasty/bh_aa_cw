class CreateTracks < ActiveRecord::Migration[5.2]
  def change
    create_table :tracks do |t|
      t.string :title
      t.integer :ord
      t.string :lyrics
      t.string :bounus_track
      t.timestamps
    end
  end
end
