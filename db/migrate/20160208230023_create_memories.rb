class CreateMemories < ActiveRecord::Migration
  def change
    create_table :memories do |t|
      t.text :content
      t.string :location
      t.float :latitude
      t.float :longitude

      t.timestamps null: false
    end
  end
end
