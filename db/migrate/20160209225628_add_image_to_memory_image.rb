class AddImageToMemoryImage < ActiveRecord::Migration
  def change
    add_column :memory_images, :image, :string
  end
end
