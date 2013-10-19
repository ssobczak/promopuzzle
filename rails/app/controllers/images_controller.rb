class ImagesController < ApplicationController
	respond_to :json

	def index
		images = Image.all.map do |img| 
			img.attributes.merge(parts: img.parts.where(user: user))
		end

		respond_with images
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
    params.require(:image).permit(:name, :title)
  end
end
