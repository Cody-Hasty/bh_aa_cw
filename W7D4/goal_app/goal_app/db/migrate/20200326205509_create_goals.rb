class CreateGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :goals do |t|
      t.string :title, null: false
      t.text :body
      t.integer :author_id, null: false
      t.boolean :completed, null: false, default: false
      t.timestamps
    end
    add_index :goals, :author_id
    add_index :goals, [:author_id, :title], unique: true
  end
end
