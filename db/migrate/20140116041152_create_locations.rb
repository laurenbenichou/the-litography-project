class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.decimal :lat
      t.decimal :lng
      t.string :location_type
      t.string :website_url
      t.string :short_text

      t.timestamps
    end
  end
end
