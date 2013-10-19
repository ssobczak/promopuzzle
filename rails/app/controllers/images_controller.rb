class ImagesController < ApplicationController
	respond_to :json

	def index
		respond_with Image.all
	end

	def show
		respond_with Image.find(params[:id])
	end

	def create
		respond_with Image.create(image_params)
	end

	def update
		respond_with Image.update(params[:id], params[:image])
	end

	def destroy
		respond_with Image.destroy(params[:id])
	end

	 def image_params
    params.require(:image).permit(:name, :age)
  end
end
