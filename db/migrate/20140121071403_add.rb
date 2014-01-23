class Add < ActiveRecord::Migration
  def change
    add_column :locations, :media_type, :string
  end
end
