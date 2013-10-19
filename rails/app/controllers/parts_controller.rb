class PartsController < ApplicationController
	respond_to :json

	def index
		respond_with Part.all
	end

	def show
		respond_with Part.find(params[:id])
	end

	def create
		respond_with Part.create(part_params)
	end

	def update
		respond_with Part.update(params[:id], params[:part])
	end

	def destroy
		respond_with Part.destroy(params[:id])
	end

	 def part_params
    params.require(:part).permit(:name, :title)
  end
end