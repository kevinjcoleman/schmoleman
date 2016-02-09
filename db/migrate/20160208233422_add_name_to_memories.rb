class AddNameToMemories < ActiveRecord::Migration
  def change
    add_column :memories, :name, :string
  end
end
