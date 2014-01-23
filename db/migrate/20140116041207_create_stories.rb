class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.text :story_text
      t.string :tags
      t.integer :location_id

      t.timestamps
    end
  end
end
