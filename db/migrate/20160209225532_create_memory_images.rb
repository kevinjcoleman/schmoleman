class CreateMemoryImages < ActiveRecord::Migration
  def change
    create_table :memory_images do |t|
      t.references :memory, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
