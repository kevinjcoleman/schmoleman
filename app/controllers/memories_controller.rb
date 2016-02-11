class MemoriesController < ApplicationController
  def show
  	@memory = Memory.find(params[:id])
    @geojson = Array.new
    @geojson << @memory.geojsonify
    respond_to do |format|
      format.html
      format.json { render json: @geojson }  # respond with the created JSON object
    end
  end

  def index
  end
end
