class Admin::MemoryImageController < ApplicationController
  def destroy
  	@memory = Memory.find(params[:memory_id])
  	@image = MemoryImage.find(params[:id])
  	@image.destroy
  	flash[:success] = "Image succesfully deleted."
  	redirect_to admin_memory_path @memory
  end
end
