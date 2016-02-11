class MemoryImage < ActiveRecord::Base
  mount_uploader :image, ImageUploader	
  belongs_to :memory
end
