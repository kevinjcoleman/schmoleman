class AddPrioritytoMemories < ActiveRecord::Migration
  def change
  	add_column :memories, :priority, :integer
  end
end
