class Admin::MemoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_admin

  def index
    @memories = Memory.prioritized
  end

  def show
    @memory = Memory.find(params[:id])
    @geojson = Array.new
    @geojson << @memory.geojsonify
    respond_to do |format|
      format.html
      format.json { render json: @geojson }  # respond with the created JSON object
    end
  end

  def new
    @memory = Memory.new
  end

  def create
    @memory = Memory.create(memory_params)
    flash[:success] = "Memory created!"
    redirect_to admin_memory_path @memory
  end

  def update
    @memory = Memory.find(params[:id])
    @memory.update_attributes(memory_params)
    flash[:success] = "#{@memory.name} updated!"
    redirect_to admin_memory_path @memory
  end

  def edit
    @memory = Memory.find(params[:id])
  end

  def destroy
    @memory = Memory.find(params[:id])
    @memory.destroy
    flash[:danger] = "#{@memory.name} destroyed!"
    redirect_to admin_memories_index_path
  end

  def sort
    params[:order].each do |key,value|
      Memory.find(value[:id]).update_attribute(:priority,value[:position])
    end
    render :nothing => true
  end

  private
    def set_admin
      @admin = true
    end

    def memory_params
      params.require(:memory).permit(:location, :content, :name)
    end
end
