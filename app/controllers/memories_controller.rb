class MemoriesController < ApplicationController
	respond_to :html, :js

  def show
  	@memory = Memory.find(params[:id])
    @geojson = Array.new
    @geojson << @memory.geojsonify
    respond_to do |format|
      format.json { render json: @geojson }  # respond with the created JSON object
      format.js
      format.html { render nothing: true  }
    end
  end

  def index
  	@memory = Memory.prioritized.first
  end
end
